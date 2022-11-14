import 'package:adam/constants/constants.dart';
import 'package:adam/model/functions/db_functions.dart';
import 'package:adam/model/studentmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ScreenEditStudents extends StatelessWidget {
  ScreenEditStudents({super.key, required this.index, required this.student});

  final int index;
  final StudentModel student;




   late final TextEditingController? _nameController;
  late final TextEditingController? _ageController;
  late final TextEditingController? _numberController;

  
  getTextEditingControllerValues(BuildContext context) {
    _nameController = TextEditingController(text: student.name);
    _ageController = TextEditingController(text: student.age);
  
    _numberController = TextEditingController(text: student.number);
  
  }


  



  @override
  Widget build(BuildContext context) {
    getTextEditingControllerValues(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Edit Students')),
        body:  Consumer<StudentModelProvoder>(
          builder: (context, value, child) {
            return  Column(children: [
              kHeight,
            CircleAvatar(
              radius: 60.0,
            ),
            kHeight,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
          
                controller: _nameController,
                 validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The  field is emplty";
                      }
                      return null;
                    },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _ageController!,
                 validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The field is emplty";
                      }
                      return null;
                    },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Age'),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _numberController!,
        
                 validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The  field is emplty";
                      }
                      return null;
                    },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Number'),
              ),
            ),
          
            ElevatedButton(
                onPressed: () {
                
                  final name = _nameController!.text;
                     final age = _ageController!.text;
        final number = _numberController!.text;
        final student = StudentModel(name: name, age: age, number: number);
        value.editStudent(index, student);
       
        Navigator.pop(context);
             
                },
                child: const Text('Update')),
          ]);
          }
        
        ));
  }
}



