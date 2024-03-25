import 'package:flutter/material.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/function/model.dart';
import 'package:image_picker/image_picker.dart';

class AddProvider extends ChangeNotifier{
  String imagepath ="";
  final formKey =GlobalKey<FormState>();
  addimage(String image){
    imagepath =image;
    notifyListeners();
  } 

  initialization(){
    imagepath ="";
    nameController.clear(); 
    classController.clear(); 
    guardianController.clear();
    mobileController.clear();
  }

  final nameController = TextEditingController();
  final classController = TextEditingController();
  final guardianController = TextEditingController();
  final mobileController = TextEditingController();

  Future <void> addstudentclick(ctx,AddProvider addprovider) async{
    if(formKey.currentState!.validate()&&addprovider.imagepath.isNotEmpty){
        final name =addprovider.nameController.text.toUpperCase();
        final classname =addprovider.classController.text.toString().trim();
        final father =addprovider.classController.text;
        final pnumber =addprovider.mobileController.text.trim();

        final stdData =StudentModel(name: name, classname: classname, father: father, pnumber: pnumber, imagex:addprovider.imagepath);
        await addstudent( stdData,addprovider);
         ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          content: Text("Successfully added"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
       initialization();
        Navigator.of(ctx).pop();
    }else{
        ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          content: Text('Add Profile Picture '),
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );

    }
  }



  Future getimage(ImageSource source,AddProvider addprovider)async{
    final image =await ImagePicker().pickImage(source: source);
    if(image ==null){
      return; 

    }
    addprovider.addimage(image.path);

  }
    void addphoto(ctxr, AddProvider addprovider, context) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          content: const Text('Profile'),
          actions: [
            IconButton(
              onPressed: () {
                getimage(ImageSource.camera, addprovider);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                getimage(ImageSource.gallery, addprovider);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.image,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }



}