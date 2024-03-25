import 'dart:io';

import 'package:flutter/material.dart';
import 'package:h1/provider/edit_provider.dart';
import 'package:provider/provider.dart';

class EditStudent extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final student;

  const EditStudent({super.key, required this.student});

  @override
  Widget build(BuildContext context) {

Provider.of<Editprovider>(context, listen: false).initiate(
        imagepath: student.imagex,
        name: student.name,
        classname: student.classname,
        father: student.father,
        pnumber: student.pnumber);
    return Consumer<Editprovider>(builder: (context,editstudnet,child){
      return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
        actions: [
          IconButton(

            
            onPressed: () {
            editstudnet.editstudentclicked (
                context,
                student,
              editstudnet
              );
            },
            icon: const Icon(Icons.cloud_upload),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: editstudnet.formKey, // Assign the form key
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () => editstudnet. editphoto(context,student,context),
                        child: CircleAvatar(
                          // ignore: unnecessary_null_comparison
                          backgroundImage: editstudnet.updateimage != null
                              ? FileImage(File(editstudnet.updateimage))
                              : FileImage(File(student.imagex)),
                          radius: 80,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // Name input field with validation
                  Row(
                    children: [
                      const SizedBox(
                          width: 10), // Add spacing between icon and text field
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: editstudnet.nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Class input field with validation
                  Row(
                    children: [
                      const SizedBox(
                          width: 10), // Add spacing between icon and text field
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: editstudnet.classController,
                          decoration: InputDecoration(
                            labelText: "Class",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Class';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Guardian input field with validation
                  Row(
                    children: [
                      const SizedBox(
                          width: 10), // Add spacing between icon and text field
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: editstudnet.guardianController,
                          decoration: InputDecoration(
                            labelText: "Parent",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Parent Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Mobile input field with validation
                  Row(
                    children: [
                      const SizedBox(
                          width: 10), // Add spacing between icon and text field
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: editstudnet.mobileController,
                          decoration: InputDecoration(
                            labelText: "Mobile",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Mobile';
                            } else if (value.length != 10) {
                              return 'Mobile number should be 10 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
    });
  }
}
