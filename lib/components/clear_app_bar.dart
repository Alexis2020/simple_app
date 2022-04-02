import 'package:flutter/material.dart';
import 'package:quiz_logic/constants.dart';


AppBar clearAppBar ([Color? colour, String? title]){
  return AppBar(
    title: Text(title?? "", style: TextStyle(fontStyle: FontStyle.normal, color: kPurpleColour, fontSize: 18,fontWeight: FontWeight.bold ),),
    toolbarHeight: 45,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(
        color: colour?? kPurpleColour
    ),
  );
}