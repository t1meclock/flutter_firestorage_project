import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/loginorsignup_screen.dart';
import '../utils/firebase_utils.dart';

import '../utils/snack_bar.dart';
import '../utils/user_utils.dart';
import 'package:fstore/models/user.dart' as models;

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    loginController.text = FirebaseAuth.instance.currentUser!.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Пользователь')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: loginController,
                        validator: (value) {
                          if (value == "") {
                            return "Поле не должно быть пустым.";
                          }
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Почта"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Пароль"),
                      ),
                    )
                  ],
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) return;

                      if (passwordController.text != "") {
                        if (passwordController.text.length >= 6) {
                          UserUtils.instanse
                              .getUser(FirebaseAuth.instance.currentUser!.uid)
                              .then((user) {
                            if (user.password != passwordController.text) {
                              FireBaseUtils.instance
                                  .updatePassword(passwordController.text)
                                  .then((status) {
                                UserUtils.instanse.update(
                                    FirebaseAuth.instance.currentUser!.email!,
                                    user.password,
                                    FirebaseAuth.instance.currentUser!.uid);
                                if (status.isSuccess) {
                                  SnackBarService.showSnackBar(context,
                                      "Пароль успешно обновлён.", true);
                                } else {
                                  SnackBarService(
                                      status.errorMessage!, context);
                                }
                              });
                            }
                          });
                        } else {
                          SnackBarService.showSnackBar(
                              context,
                              "Пароль должен содержать более 8 символов.",
                              false);
                        }
                      }
                      if (FirebaseAuth.instance.currentUser!.email! !=
                          loginController.text) {
                        FireBaseUtils.instance
                            .updateEmail(loginController.text)
                            .then((status) {
                          if (status.isSuccess) {
                            UserUtils.instanse
                                .getUser(FirebaseAuth.instance.currentUser!.uid)
                                .then((user) {
                              UserUtils.instanse.update(
                                  FirebaseAuth.instance.currentUser!.email!,
                                  user.password,
                                  FirebaseAuth.instance.currentUser!.uid);
                            });
                            SnackBarService.showSnackBar(
                                context, "Почта успешно обновлена.", true);
                          } else {
                            SnackBarService(status.errorMessage!, context);
                          }
                        });
                      }
                    },
                    child: const Text("Сохранить данные")),
                ElevatedButton(
                    onPressed: () {
                      String uid = FirebaseAuth.instance.currentUser!.uid;
                      FireBaseUtils.instance
                          .deleteAccount()
                          .then((status) async {
                        if (status.isSuccess) {
                          await UserUtils.instanse.delete(uid);
                        } else {
                          SnackBarService(status.errorMessage!, context);
                        }
                      });
                      SnackBarService.showSnackBar(
                          context, "Аккаунт успешно удалён.", true);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EnterScreen()));
                    },
                    child: const Text("Удалить аккаунт")),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EnterScreen()));
                    },
                    child: const Text("Выйти"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
