import 'dart:typed_data';

class StorageImageModel {
  final String folderName;
  final String subFolderName;
  final String imageName;
  final Uint8List file;

  StorageImageModel({
    required this.folderName,
    required this.subFolderName,
    required this.imageName,
    required this.file,
  });
}
