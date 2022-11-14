import 'package:adam/model/functions/db_functions.dart';
import 'package:adam/model/studentmodel.dart';
import 'package:adam/screens/scrren_stuedntlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async  {
  
   WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   if (!Hive.isAdapterRegistered(0)){
    Hive.registerAdapter(StudentModelAdapter());
   }
   await Hive.openBox<StudentModel>('student_db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentModelProvoder(),
      child: const MaterialApp(
         debugShowCheckedModeBanner: false,   
          home:  ScreenStudentList(),
        
      ),
    );
  }
}