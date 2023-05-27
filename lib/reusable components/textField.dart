import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/theme/colours.dart';


Widget buildTextField(String labelText,String placeHolder,TextEditingController controller,TextInputType textInputType,Function function){

  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextFormField(

     keyboardType: textInputType,
      controller:controller ,
      decoration: InputDecoration(

          hoverColor: primary,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primary,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeHolder,
          hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )

      ),
    ),
  );
}