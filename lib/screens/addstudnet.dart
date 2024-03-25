import 'dart:io';

import 'package:flutter/material.dart';
import 'package:h1/provider/add_provider.dart';
import 'package:provider/provider.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProvider>(
      builder: (context,addStudnet,child){
        return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Add Student'),
          actions: [
            IconButton(
              onPressed: () {
              addStudnet.addstudentclick(context ,addStudnet);
              },
              icon: const Icon(Icons.save_alt_outlined),
            )
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: addStudnet.formKey, // The form key
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                          backgroundImage: addStudnet.imagepath.isNotEmpty ?
                               FileImage(File(addStudnet.imagepath))
                              : const AssetImage('images/sd1.png')
                                  as ImageProvider,
                          radius: 99),
                      Positioned(
                        bottom: 20,
                        right: 5,
                        child: IconButton(
                          onPressed: () {
                            addStudnet.addphoto(context ,addStudnet,context);
                          },
                          icon: const Icon(Icons.camera_alt),
                          color: Colors.white,
                          iconSize: 40,
                        ),
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 50),
      
                  // Name input field with validation
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: addStudnet.nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: 'enter name',
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
                  const SizedBox(height: 20),
      
                  // Class input field with validation
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: addStudnet.classController,
                    decoration: InputDecoration(
                      labelText: "Class",
                      hintText: 'enter class',
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
                  const SizedBox(height: 20),
      
                  // Guardian input field with validation
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: addStudnet.guardianController,
                    decoration: InputDecoration(
                      labelText: "Guardian",
                      hintText: 'enter Guardian name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Guardian';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
      
                  // Mobile input field with validation
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: addStudnet.mobileController,
                    decoration: InputDecoration(
                      labelText: "Mobile",
                      hintText: 'Mobile Number',
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
                ],
              ),
            ),
          ),
        ),
      );
      },

      
    );
  }
}
