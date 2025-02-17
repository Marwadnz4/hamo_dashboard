class CategoryRequestBody {
  final String categoryName;
  final String cover;
  final String folderNameInFirebaseStorage;

  CategoryRequestBody({
    required this.categoryName,
    required this.cover,
    required this.folderNameInFirebaseStorage,
  });

  Map<String, dynamic> toJson() => {
    'categoryName': categoryName,
    'cover': cover,
    'folderNameInFirebaseStorage': folderNameInFirebaseStorage,
  };
}
