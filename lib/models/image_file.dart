import 'dart:io';

class ImageFile {
  final size;
  File? file;
  final fileExt;
  String? filename;
  bool? mine;
  String? path;

  ImageFile(
      {required this.size,
      this.file,
      required this.fileExt,
      this.filename,
      this.path});

  Map<String, dynamic> toMap(filename, path) {
    return {
      "filename": this.filename ?? filename,
      "size": size,
      "fileExt": fileExt,
      "path": this.path ?? path
    };
  }

  static ImageFile? fromJson(Map<String, dynamic> data, String uid) {
    if (_getAddFromFileName(data["filename"]) != uid) {
      return null;
    }
    return ImageFile(
        size: data["size"],
        fileExt: data["fileExt"],
        filename: data["filename"],
        path: data["path"]);
  }

  static String _getAddFromFileName(String filename) {
    return filename.split("_")[0];
  }
}
