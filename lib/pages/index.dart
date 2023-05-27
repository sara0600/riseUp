import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:rise/pages/add.dart';
import 'package:rise/pages/details.dart';
import 'package:rise/pages/user.dart';
import 'package:rise/pages/users.dart';
import 'package:rise/theme/colours.dart';
class IndexPage extends StatefulWidget {

  const IndexPage() : super();

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

List<User> usersList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(Users.users.isEmpty) {
      fetchUser();
    }
  }

  fetchUser() async {
    http.Response response;
    try {
      var url = Uri.parse('https://gorest.co.in/public/v2/users');
      response = await http.get(url);
    }
  catch(error){
      print(error);
  }
    if (response.statusCode == 200) {
      List items = jsonDecode(response.body);
      setState(() {
        for (int i = 0; i < items.length; i++) {
          Users.addUser(items[i]);
          isLoading=false;
        }

      });


    }
    else{
      isLoading=true;
    }
}
    @override
    Widget build(BuildContext context) {
    usersList=Users.users;
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddPage()));
            setState(() {

            });
            print('in the index page');
          },
          child: Icon(
            Icons.add,
          ),
        ),
        appBar: AppBar(
          title: Center(
            child: Text(''
                'Users'),
          ),

        ),
        body: getBody(),
      );
    }
    Widget getBody() {

      if (usersList.contains(null) || usersList.length < 0 || isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
          itemCount: usersList.length,
          itemBuilder: (context, index) {
            return getCard(usersList[index],index);
          });
    }
    Widget getCard(item,index) {
      return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              trailing: SizedBox(
                width: 70,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) =>
                            DetailsPage(id: item.id,
                              name: item.name,
                              email: item.email,
                              gender: item.gender,
                              status: item.status,)));

                       setState(() {

                       });
                      },
                      child: Icon(
                        Icons.edit,
                      ),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {

                       Users.users.removeAt(index);
                        setState(() {

                        });
                      },
                      child: Icon(
                        Icons.delete_sharp,

                      ),
                    ),
                  ],
                ),
              ),
              selectedTileColor: primary,
              title: Text(
                item.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ),
          )
      );
    }
  }

