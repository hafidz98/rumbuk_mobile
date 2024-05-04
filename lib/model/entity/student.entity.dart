class StudentEntity {
  final String emailOrStudentId;
  final String password;
  final String name;

  StudentEntity(
      {required this.emailOrStudentId,
      required this.password,
      required this.name});
}
