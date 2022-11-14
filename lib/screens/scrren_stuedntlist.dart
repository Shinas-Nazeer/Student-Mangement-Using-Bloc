import 'package:adam/model/functions/db_functions.dart';
import 'package:adam/screens/addstudent/screen_addstudets.dart';
import 'package:adam/screens/editstudent/screen_editstudent.dart';
import 'package:adam/screens/viewstudents/screen_viewstudents.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenStudentList extends StatelessWidget {
  const ScreenStudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
        title: const Text('Student App'),
      ),
      body: Consumer<StudentModelProvoder>(
        builder: (context, value, child) {
          value.getAllStudents();
          return ListView.builder(
              itemCount: value.studentmodel.length,
              itemBuilder: (context, index) {
              
                return ListTile(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenViewStudent(
                                index: index,
                              )),
                    );
                  }),
                  leading: CircleAvatar(),
                  title: Text(value.studentmodel[index].name),
                  subtitle: Text(value.studentmodel[index].age),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: (() {
                          value.deleteStudent(index);
                        ScaffoldMessenger.of(context).showSnackBar(

                         const SnackBar(
                          backgroundColor: Colors.red,                       
                          content: Text('Deleted Sucessfully'))
                        );
                          
                        }),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                    
                                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenEditStudents(index: index, student: value.studentmodel[index],
                                        
                              )),
                    );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blueGrey,
                          ))
                    ],
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScreenAddStudents()),
          );
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}


