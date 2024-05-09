import 'package:id_rumbuk_app/exception/mapper.exception.dart';
import 'package:id_rumbuk_app/model/entity/student.entity.dart';
import 'package:id_rumbuk_app/screens/profile/dto/student.response.dart';

class StudentMapper {
  StudentEntity toStudent(StudentResponse studentResponse){
    try {
      return StudentEntity(
        studentId: studentResponse.studentId,
        name: studentResponse.name,
        batchYear: studentResponse.batchYear,
        email: studentResponse.email,
        faculty: studentResponse.faculty,
        gender: studentResponse.gender,
        major: studentResponse.major,
        phoneNumber: studentResponse.phoneNumber,
      );
    } catch (e) {
      throw MapperException<StudentResponse, StudentEntity>(e.toString());
    }
  }
}