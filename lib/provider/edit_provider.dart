import 'package:flutter/material.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/function/model.dart';
import 'package:image_picker/image_picker.dart';

class Editprovider extends ChangeNotifier{
  String updateimage ="";
  
  final formKey = GlobalKey<FormState>(); //  form key for the validation

  final nameController = TextEditingController();
  final classController = TextEditingController();
  final guardianController = TextEditingController();
  final mobileController = TextEditingController();
addimage(String image) {
  updateimage  = image;
    notifyListeners();
  }
  initiate({
    required String imagepath,
    required String name,
    required String classname,
    required String father,
    required String pnumber,
  }){
    nameController.text = name;
    classController.text = classname;
    guardianController.text =father;
    mobileController.text = pnumber;
     updateimage= imagepath;

  }
  Future<void> geterimage(ImageSource source, Editprovider editProvider) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }

    editProvider.addimage(image.path);
  }
   Future<void> editstudentclicked(BuildContext context, StudentModel student,
      Editprovider editprovide) async {
    if (formKey.currentState!.validate()) {
      final name = nameController.text.toUpperCase();
      final classA = classController.text.toString().trim();
      final father = guardianController.text;
      final phonenumber = mobileController.text.trim();

      final updatedStudent = StudentModel(
        id: student.id,
        name: name,
        classname: classA,
        father: father,
        pnumber: phonenumber,
        imagex: editprovide.updateimage,
      );
      Navigator.of(context).pop();
      await editStudent(
          student.id!,
          updatedStudent.name,
          updatedStudent.classname,
          updatedStudent.father,
          updatedStudent.pnumber,
          updatedStudent.imagex,
          context
          );
    }
  }
   void editphoto(ctxr,Editprovider   editProvider, context) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          title: const Text('Update Photo '),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    const Text('Choose from camera'),
                    IconButton(
                      onPressed: () {
                        geterimage(ImageSource.camera, editProvider);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Choose from gallery '),
                    IconButton(
                      onPressed: () {
                        geterimage(ImageSource.gallery, editProvider);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.image,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }


}