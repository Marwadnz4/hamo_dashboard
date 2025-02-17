class AdminResponse {
  final String uid;
  final String name;
  final String email;

  factory AdminResponse.fromJson(Map<String, dynamic> json) => AdminResponse(
    uid: json['uid'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
  );

  AdminResponse({required this.uid, required this.name, required this.email});
}
