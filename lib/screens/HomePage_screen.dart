import 'package:flutter/material.dart';
import 'package:github_users_flutter/domain/event_modal.dart';
import 'package:github_users_flutter/domain/user_modal.dart';
import 'package:github_users_flutter/helper/dialog.dart';
import 'package:github_users_flutter/networking/events_networking.dart';
import 'package:github_users_flutter/networking/user_network.dart';

import 'User_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String username;
  User user;
  List<Event> eventList;
  TextEditingController userNameController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: createBottomBar(),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff24292E)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  'assets/github-mark.png',
                ),
              ),
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 50.0, right: 50.0),
                          child: TextFormField(
                            controller: userNameController,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            cursorColor: Colors.blue,
                            decoration: const InputDecoration(
                              fillColor: Colors.greenAccent,
                              border: OutlineInputBorder(),
                              hintText: 'Enter your username',
                              hintStyle: TextStyle(color: Colors.blueGrey),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: RaisedButton(
                              onPressed: () {
                                _selectDate(userNameController.text);
                              },
                              child: Text('Search'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget createBottomBar() {
    return Container(
      color: Color(0xff24292E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Created LucssCarvalho',
            style: TextStyle(fontSize: 10, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

  _selectDate(username) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      var responseUser = await UserNetworking.searchUser(username);
      if (responseUser != null) {
        var responseEvents = await EventsNetworking.searchEvent(username);
        setState(() {
          eventList = responseEvents;
          user = responseUser;
        });

        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => UserScreen(user, eventList),
          ),
        );
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        return showDialog(
          builder: (BuildContext context) => CustomDialog(
            title: "User not found",
            description: "user not found or \naccount does not exist",
            buttonText: "back",
          ),
          context: context,
        );
      }
    }
  }
}
