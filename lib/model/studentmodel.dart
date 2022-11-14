import 'package:hive_flutter/hive_flutter.dart';
part 'studentmodel.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;
 
  @HiveField(2)
  final String number;

  StudentModel({required this.name, required this.age, required this.number});
}
