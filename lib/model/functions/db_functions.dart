import 'package:adam/model/studentmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StudentModelProvoder extends ChangeNotifier {
  List<StudentModel> studentmodel = [];

  Future<void> addStudent(StudentModel value) async {
    final studentDb = await Hive.openBox<StudentModel>('student_db');
    await studentDb.add(value);
    getAllStudents();
  }

  Future<void> getAllStudents() async {
    final studentDb = await Hive.openBox<StudentModel>('student_db');
    studentmodel.clear();
    studentmodel.addAll(studentDb.values);
    notifyListeners();
  }

  Future<void> deleteStudent(index) async {
    final studentDb = await Hive.openBox<StudentModel>('student_db');
    await studentDb.deleteAt(index);
    getAllStudents();
    notifyListeners();
  }

  Future<void> editStudent(index, StudentModel value) async {
    final studentDb = await Hive.openBox<StudentModel>('student_db');
    await studentDb.putAt(index, value);
    getAllStudents();
    notifyListeners();
  }
}
