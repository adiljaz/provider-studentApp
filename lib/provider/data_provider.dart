import 'package:flutter/material.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/function/model.dart';

class StudnetProvier extends ChangeNotifier{
  List<StudentModel> studnetlist =<StudentModel>[];
  List<StudentModel> filteresult = <StudentModel>[];

  initialize() async{
    dynamic data  =await getstudentdata();
    studnetlist=data;
    notifyListeners(); 
  }

  getsearchdata(String query)async{
    await initialize(); 

    if(query.isEmpty){
      filteresult =studnetlist;

    }else {
      List<StudentModel> s = studnetlist
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.classname.toLowerCase().contains(query.toLowerCase()))
          .toList();
      filteresult = s;
      
    }
  }
}