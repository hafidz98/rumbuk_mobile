class LoginRequest{
  String? emailOrStudentId;
  String? password;

  LoginRequest({this.emailOrStudentId, this.password});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = emailOrStudentId;
    data['password'] = password;
    return data;
  }
}