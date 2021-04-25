import 'package:flutter/material.dart';
import 'package:github_users_flutter/domain/event_modal.dart';
import 'package:github_users_flutter/domain/user_modal.dart';
import 'package:github_users_flutter/helper/dialog.dart';
import 'package:github_users_flutter/networking/company_networking.dart';
import 'package:github_users_flutter/networking/repository_networking.dart';
import 'package:github_users_flutter/screens/ListRepositories_screen.dart';
import 'package:github_users_flutter/screens/company_screen.dart';
import '../domain/repository_modal.dart';
import 'ListRepositories_screen.dart';

// ignore: must_be_immutable
class UserScreen extends StatefulWidget {
  User newUser;
  List<Event> eventList;

  UserScreen(this.newUser, this.eventList);
  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRepository(widget.newUser.login);
  }

  List<Repository> repositories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff24292E),
      ),
      body: Center(
        child: Container(
          color: Colors.blueGrey[100],
          child: Column(
            children: <Widget>[
              _createUser(),
              repositories == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(child: ListRepositories(repositories))
            ],
          ),
        ),
      ),
    );
  }

  _createUser() {
    User user = widget.newUser;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
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

  cardDataUser(user, context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              child: itemMenu(
                user.company,
                Icons.business,
                'company',
              ),
              onTap: () {
                _selectCompany(user.company, context);
              },
            ),
            itemMenu(user.publicRepos.toString(), Icons.import_contacts,
                'public repository'),
            itemMenu(user.location, Icons.location_on, 'location'),
          ],
        ),
      ),
    );
  }

  itemMenu(String option, IconData icons, String label) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 110,
        child: Column(
          children: <Widget>[
            Icon(
              icons,
              color: Colors.grey[700],
              size: 35,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 11),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                option != null ? option : 'no ${label}',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getRepository(username) async {
    var response = await RepositoryNetworking.searchRepos(username);
    setState(() {
      repositories = response;
    });
  }

  _selectCompany(String company, context) async {
    var response = await CompanyNetworking.searchCompany(company);
    if (response != null) {
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => CompanyScreen(response),
        ),
      );
    } else {
      return showDialog(
        builder: (BuildContext context) => CustomDialog(
          title: "company not found",
          description: "company does not exist or has an anonymity clause",
          buttonText: "back",
        ),
        context: context,
      );
    }
  }
}
