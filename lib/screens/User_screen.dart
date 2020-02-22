import 'package:flutter/material.dart';
import 'package:github_users_flutter/domain/repository_modal.dart';
import 'package:github_users_flutter/domain/user_modal.dart';
import 'package:github_users_flutter/widgets/details_page_widgets.dart';

class User_screen extends StatefulWidget {
  User newUser;
  User_screen(this.newUser);
  @override
  _User_screenState createState() => _User_screenState();
}

class _User_screenState extends State<User_screen> {
  Future<List<Repository>> _repositoriesFuture;
  List<Repository> _repositories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff24292E),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _createUser(),
          ],
        ),
      ),
    );
  }

  _createUser() {
    User user = widget.newUser;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A556A), Color(0xff24292E)]),
        boxShadow: [
          new BoxShadow(
            color: Colors.black,
            offset: new Offset(0.0, 0.5),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage("${user.avatarUrl}"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Text(
                      '${user.login}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      '${user.name != null ? user.name : 'no name defined'}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          cardDataUser(user, context),
        ],
      ),
    );
  }
}
