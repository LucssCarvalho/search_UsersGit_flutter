import 'package:flutter/material.dart';
import 'package:github_users_flutter/domain/repository_modal.dart';
import 'package:github_users_flutter/networking/respository_networking.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String username;
  List<RepositoryResponse> _repositories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff3A556A), Color(0xff24292E)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                      cursorColor: Colors.blue,
                      decoration: const InputDecoration(
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
                          _selectDate('LucssCarvalho');
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

  _selectDate(username) async {
    var response = await RepositoryNetworking.searchRepos(username);
    print(response);
    setState(() {
      _repositories = response;
    });
  }

  Future<List<RepositoryResponse>> searchRepos(username) async {
    var user = RepositoryNetworking.searchRepos(username);
    print(user);
    return user;
  }
}
