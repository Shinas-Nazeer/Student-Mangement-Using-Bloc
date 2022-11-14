import 'package:adam/constants/constants.dart';
import 'package:adam/model/functions/db_functions.dart';
import 'package:adam/model/studentmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/textfield.dart';

class ScreenAddStudents extends StatelessWidget {
  const ScreenAddStudents({super.key});

  @override
  Widget build(BuildContext context) {
    String names = 'name';
    String age = 'age';
    String number = 'number';
    return Scaffold(
      appBar: AppBar(title: const Text('Add Students')),
      body: Consumer<StudentModelProvoder>(
        builder: (context, value, child) {
          return Column(
            
              children: [
               kHeight,
                CircleAvatar(
                  radius: 60.0,
                ),
                TextField1(
                  label: 'Name',
                  onPressed: (value) {
                    names = value;
                  }, 
                ),
                TextField1(
                  label: 'Age',
                  onPressed: (value) {
                    age = value;
                  }, 
                ),
                TextField1(
                  label: 'Phone Number',
                  onPressed: (value) {
                    number = value;
                  }, 
                ),
                ElevatedButton(
                    onPressed: () {
                      final student =
                          StudentModel(name: names, age: age, number: number);
                      value.addStudent(student);
                            ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text('Student Added Sucessfully'))
                        );
                      Navigator.pop(context);
                    },
                    child: const Text('Add Students')),
              ]);
        },
      ),
    );
  }



}


