import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/image_file.dart';
import '../utils/files_utils.dart';
import '../utils/images_files_utils.dart';

import 'package:url_launcher_android/url_launcher_android.dart';
import '../utils/firestorage_utils.dart';
import 'package:path/path.dart' as p;

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AllUsersPageState();
}

class AllUsersPageState extends State<AllUsersPage> {
  late Stream<List<ImageFile?>> images;

  @override
  void initState() {
    images =
        ImageFileUtils.instanse.get(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  TextEditingController filenameController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  void showImageDialog(String filenameBase, filenameEdit, path) {
    filenameController.text = filenameEdit;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                      key: key,
                      child: TextFormField(
                        controller: filenameController,
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "Имя файла должно быть заполнено.";
                          }
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            if (!key.currentState!.validate()) return;
                            File file = await FilesUtils.fileFromImageUrl(path);
                            final size = file.lengthSync();
                            final fileExt = p.extension(file.path);
                            final imagefile = ImageFile(
                                size: size, file: file, fileExt: fileExt);
                            String newFileName =
                                FireStorageUtils.getFileNameByName(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    filenameController.text + fileExt);
                            await FilesUtils.updateFile(
                                filenameBase, newFileName, imagefile);
                            Navigator.of(context).pop();
                          },
                          child: Text("Сохранить")),
                      ElevatedButton(
                          onPressed: () {
                            filenameController.text = "";
                            Navigator.of(context).pop();
                          },
                          child: Text("Отмена"))
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FilesUtils.uploadImage();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder(
          stream: images,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return ListView(
              children: snapshot.data!.map((image) {
                if (image != null) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: new Border.all(
                            color: Color.fromARGB(255, 121, 94, 255),
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: new BorderRadius.only(
                        topLeft: new Radius.circular(20.0),
                        topRight: new Radius.circular(20.0),
                        bottomRight: new Radius.circular(20.0),
                         bottomLeft: new Radius.circular(20.0) ), 
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(
                                width: 150, height: 150),
                            child: Image(image: NetworkImage(image.path!)),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 6)),
                          Text("Название файла: " +
                              FilesUtils.resFileName(image.filename!)),
                          Padding(padding: EdgeInsets.only(bottom: 6)),
                          Text("Размер файла: " +
                              FilesUtils.resSize(image.size)),
                          Padding(padding: EdgeInsets.only(bottom: 6)),
                          GestureDetector(
                            onTap: () async {
                              Uri uri = Uri(path: image.path!);
                              await UrlLauncherAndroid().launch(
                                image.path!,
                                useSafariVC: true,
                                useWebView: false,
                                enableJavaScript: false,
                                enableDomStorage: true,
                                universalLinksOnly: false,
                                headers: <String, String>{
                                  'my_header_key': 'my_header_value'
                                },
                              );
                            },
                            child: Text(
                              textAlign: TextAlign.center,
                              "Ссылка на фото: " + image.path!,
                              style: TextStyle(color: Colors.deepPurpleAccent),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    showImageDialog(
                                        image.filename!,
                                        FilesUtils
                                            .resFileWoNameExt(
                                                image.filename!),
                                        image.path!);
                                  },
                                  child: Text("Изменить")),
                              ElevatedButton(
                                  onPressed: () async {
                                    String filename = image.filename!;
                                    FilesUtils.deleteImage(filename);
                                  },
                                  child: Text("Удалить"))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
