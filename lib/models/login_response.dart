class LoginResponse {
  final String uid;

  LoginResponse({required this.uid});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      uid: json['uid'] as String,
    );
}

