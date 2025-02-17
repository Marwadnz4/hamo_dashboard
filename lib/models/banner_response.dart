class BannerResponse {
  final String bannerDocId;
  final String cover;
  final String folderNameInFirebaseStorage;

  BannerResponse({
    required this.bannerDocId,
    required this.cover,
    required this.folderNameInFirebaseStorage,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
    bannerDocId: json['bannerDocId'] as String,
    cover: json['cover'] as String,
    folderNameInFirebaseStorage: json['folderNameInFirebaseStorage'] as String,
  );
}
