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
  final formKey=GlobalKey<FormState>();
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
          child: Form(
        key: formKey,
            child: ListView(

                children:[
                  Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: TextFormField(
         validator:(value){

           if(value!.isEmpty){

             return('please enter correct name');
               }
            else {
           return null;
             }},
              keyboardType:TextInputType.name ,
              controller:nameController ,
              decoration: InputDecoration(

                  hoverColor: primary,
                  contentPadding: EdgeInsets.only(bottom: 5),
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )

              ),
            ),
          ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextFormField(
                      validator:(value){
                        if(value!.isEmpty){
                        return('please enter correct id');
                         }
                 else {
                       return null;
                   }},


                      keyboardType:TextInputType.number,
                      controller:idController ,
                      decoration: InputDecoration(

                          hoverColor: primary,
                          contentPadding: EdgeInsets.only(bottom: 5),
                          labelText: 'Id',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          )

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextFormField(
                      validator:(value){ if(value!.isEmpty){
                        return('please enter correct email');
                      }
                      else {
                        return null;
                      }},


                      keyboardType:TextInputType.emailAddress ,
                      controller:emailController ,
                      decoration: InputDecoration(

                          hoverColor: primary,
                          contentPadding: EdgeInsets.only(bottom: 5),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          )

                      ),
                    ),
                  ),


                  buildTextField('Gender', '',genderController,TextInputType.text,(){}),
                  buildTextField('Status', '',statusController,TextInputType.text,(){}),
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
                            print('in the save button');
                              if(formKey.currentState!.validate()){
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) =>
                                    IndexPage()), (Route<
                                dynamic> route) => false);}

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
      ),
    );
  }


  }
