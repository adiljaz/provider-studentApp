import 'dart:io';

import 'package:flutter/material.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/function/model.dart';
import 'package:h1/provider/data_provider.dart';
import 'package:h1/screens/edit.dart';
import 'package:h1/screens/studentdetails.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  List<StudentModel> finduser = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<StudnetProvier>(builder: (context,studnet,child)=> Scaffold(
      body: SafeArea(
        child:  Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      onChanged: (value) => studnet.getsearchdata(value),
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: finduser.length,
                      itemBuilder: (context, index) {
                        final finduserItem = finduser[index];
                        return Card(
                          color: const Color.fromARGB(255, 160, 207, 246),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  FileImage(File(finduserItem.imagex)),
                            ),
                            title: Text(finduserItem.name),
                            subtitle: Text('CLASS : ${finduserItem.classname}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          EditStudent(student: finduserItem),
                                    ));
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    deletestudent(context, finduserItem);
                                  },
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (ctr) =>
                                    StudentDetails(stdetails: finduserItem),
                              ));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
         
      ),
    )); 
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
    deleteStudent(student.id!, ctx);
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
