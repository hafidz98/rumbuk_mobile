class LoginResponse{
  final String? token;
  final String? studentId;

  LoginResponse({this.token, this.studentId});

  factory LoginResponse.fromJson(Map<String, dynamic> json, String? token) => LoginResponse(
    token: token,
    studentId: json['user_id'],
  );
}

//
// 'name': String name,
// 'studentId': String studentId,
