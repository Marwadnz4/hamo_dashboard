class CategoryResponse {
  final String categoryDocId;
  final String categoryName;
  final String cover;
  final String folderNameInFirebaseStorage;

  CategoryResponse({
    required this.categoryDocId,
    required this.categoryName,
    required this.cover,
    required this.folderNameInFirebaseStorage,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        categoryDocId: json['categoryDocId'] as String,
        categoryName: json['categoryName'] as String,
        cover: json['cover'] as String,
        folderNameInFirebaseStorage:
            json['folderNameInFirebaseStorage'] as String,
      );

  Map<String, dynamic> toJson() => {
    'categoryDocId': categoryDocId,
    'categoryName': categoryName,
    'cover': cover,
    'folderNameInFirebaseStorage': folderNameInFirebaseStorage,
  };
}
