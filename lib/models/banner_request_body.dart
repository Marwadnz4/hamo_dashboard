
class BannerRequestBody {
  final String cover;
  final String folderNameInFirebaseStorage;

  BannerRequestBody({
    required this.cover,
    required this.folderNameInFirebaseStorage,
  });

  Map<String, dynamic> toJson() => {
      'cover': cover,
      'folderNameInFirebaseStorage': folderNameInFirebaseStorage,
    };
}