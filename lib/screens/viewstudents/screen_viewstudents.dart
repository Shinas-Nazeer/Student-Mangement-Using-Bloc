import 'package:adam/model/functions/db_functions.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



  class ScreenViewStudent extends StatelessWidget {
  const ScreenViewStudent({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
  return Scaffold(appBar: AppBar(title: const Text('Student Details')),
  body:Consumer<StudentModelProvoder>(
    builder: (context, value, child) {
      final student = value.studentmodel[index];
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: CircleAvatar(
                    
                    radius: 60,
                  ),
                ),
                const SizedBox(height: 30),
                Details(
                  labeltext: 'Name : ${student.name}',
                ),
                Details(
                  labeltext: 'Age :${student.age} ',
                ),
              
                Details(
                  labeltext: 'Ph :${student.number} ',
                ),
              ],
            ),
          ),
        );
      
    },
  
  ),
  );

  }}



  class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.labeltext,
  }) : super(key: key);

  final String labeltext;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 235, 233, 233),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 15),
        child: Text(
          
          labeltext,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}