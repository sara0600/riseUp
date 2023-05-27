
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:rise/pages/user.dart';

 class Users{
  static List<User> users=[];

static  addUser(items)async{

 var name =items['name'];

 var id=items['id'];
var email=items['email'];
var gender=items['gender'];
 var status=items['status'];
   
users.add(User(id: id,name:name,email: email,gender:gender,status:status));

  }


}

