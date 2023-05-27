import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/pages/user.dart';
import 'package:rise/pages/users.dart';
import 'package:rise/reusable%20components/textField.dart';
import 'package:rise/theme/colours.dart';

import 'index.dart';

class AddPage extends StatefulWidget {
  const AddPage() : super();

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController idController =TextEditingController();
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController genderController =TextEditingController();
  TextEditingController statusController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left:15,top:20,right:15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(

              children:[
                buildTextField('Name','',nameController,TextInputType.name),
                buildTextField('Id ', '',idController,TextInputType.number),
                buildTextField('Email', '',emailController,TextInputType.emailAddress),
                buildTextField('Gender', '',genderController,TextInputType.text),
                buildTextField('Status', '',statusController,TextInputType.text),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(

                      onPressed: (){
                        String name =nameController.text.trim();
                        String email =emailController.text.trim();
                        String gender=genderController.text.trim();
                        String status=statusController.text.trim();
                        int  id =int.parse(idController.text);

                        if(name.isNotEmpty&&email.isNotEmpty&&gender.isNotEmpty&&status.isNotEmpty&&idController.text.isNotEmpty) {
                          setState(() {
                            Users.users.add(User(id: id,
                                name: name,
                                email: email,
                                gender: gender,
                                status: status));
                          });
                          isLoading = false;
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                                  IndexPage()), (
                              Route<dynamic> route) => false);
                        }


                        }
                      ,
                      child: Text(
                        'save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:20,
                          letterSpacing: 2,
                          color: Colors.black87,

                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: primary,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),

                  ],
                )

              ]
          ),
        ),
      ),
    );
  }


  }
