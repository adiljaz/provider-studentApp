import 'dart:io';

import 'package:flutter/material.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/function/model.dart';
import 'package:h1/provider/data_provider.dart';
import 'package:h1/screens/edit.dart';
import 'package:h1/screens/studentdetails.dart';
import 'package:provider/provider.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<StudnetProvier>(context,listen: true).initialize();
    return Consumer<StudnetProvier>(
      builder: (context ,studnet,child){
        return ListView.builder(
            itemCount: studnet.studnetlist.length,
            itemBuilder: (context, index) {
              final student = studnet.studnetlist[index];
      
              return Card(
                color: Colors.lightBlue[50],
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      File(student.imagex),
                    ),
                  ),
                  title: Text(student.name),
                  subtitle: Text(
                    "Class: ${student.classname}",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditStudent(student: student),
                          ));
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          deletestudent(context, student);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctr) => StudentDetails(stdetails: student),
                    ));
                  },
                ),
              );
            },
          );
      },
      
    );
   
  }

  void deletestudent(ctx, StudentModel student) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Do You Want delete the list ?'),
          actions: [
            TextButton(
              onPressed: () {
                detectedYes(context, student);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void detectedYes(ctx, StudentModel student) {
    deleteStudent(student.id!,ctx);
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        content: Text("Successfully Deleted"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.of(ctx).pop();
  }
}
