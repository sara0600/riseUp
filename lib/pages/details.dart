import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise/pages/user.dart';
import 'package:rise/pages/users.dart';
import 'package:rise/reusable%20components/textField.dart';
import 'package:rise/theme/colours.dart';

import 'index.dart';

class DetailsPage extends StatefulWidget {


  final gender,email,name,id,status;

  DetailsPage( {this.id,this.name,this.email,this.gender,this.status}) : super();

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final formKey=GlobalKey<FormState>();
 TextEditingController idController =TextEditingController();
 TextEditingController nameController =TextEditingController();
 TextEditingController emailController =TextEditingController();
 TextEditingController genderController =TextEditingController();
 TextEditingController statusController =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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
                buildTextField('Name', widget.name.toString(),nameController,TextInputType.name,(){}),
            Padding(

              padding: EdgeInsets.only(bottom: 30),
              child: TextFormField(

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hoverColor: primary,
                    contentPadding: EdgeInsets.only(bottom: 5),
                    labelText: 'ID',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: widget.id.toString(),
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )

                ),
              ),
            ),

                buildTextField('Email', widget.email.toString(),emailController,TextInputType.emailAddress,(){}),
                buildTextField('Gender', widget.gender.toString(),genderController,TextInputType.text,(){}),
                buildTextField('Status', widget.status.toString(),statusController,TextInputType.text,(){}),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(

                      onPressed: (){
                     /*   if(formKey.currentState.validate()){
                          print('validated');

                        }
                        else{
                          print('not validated');
                        }*/
                        String name =nameController.text.trim().isEmpty?widget.name:nameController.text.trim();
                        String email =emailController.text.trim().isEmpty?widget.email:emailController.text.trim();
                        String gender=genderController.text.trim().isEmpty?widget.gender:genderController.text.trim();
                        String status=statusController.text.trim().isEmpty?widget.status:statusController.text.trim();
                        print (name);
                        if(name.isNotEmpty&&email.isNotEmpty&&gender.isNotEmpty&&status.isNotEmpty){


                            int index= Users.users.indexWhere((user) => user.id==widget.id);

                            Users.users[index]=User(id: widget.id,name: name,email: email,gender: gender,status: status);
                            print(Users.users[index].name);

                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                IndexPage()), (Route<dynamic> route) => false);


                        }
                      },
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
                    SizedBox(width: 20,),


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
