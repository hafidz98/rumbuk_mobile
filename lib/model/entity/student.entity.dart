class StudentEntity {
  String? studentId;
  String? name;
  String? gender;
  int? batchYear;
  String? major;
  String? faculty;
  String? phoneNumber;
  String? email;

  StudentEntity({
    this.studentId,
    this.name,
    this.gender,
    this.batchYear,
    this.major,
    this.faculty,
    this.phoneNumber,
    this.email,
  });

  factory StudentEntity.fromMap(Map<String, dynamic> json) => StudentEntity(
    studentId: json["student_id"],
    name: json["name"],
    gender: json["gender"],
    batchYear: json["batch_year"],
    major: json["major"],
    faculty: json["faculty"],
    phoneNumber: json["phone_number"],
    email: json["email"],
  );
}
