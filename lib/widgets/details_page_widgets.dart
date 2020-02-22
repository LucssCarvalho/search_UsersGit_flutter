import 'package:flutter/material.dart';
import 'package:github_users_flutter/domain/user_modal.dart';
import 'package:github_users_flutter/helper/dialog.dart';
import 'package:github_users_flutter/networking/repository_networking.dart';
import 'package:github_users_flutter/screens/ListRepositories_screen.dart';

cardDataUser(User user, context) {
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
              _selectCompany(user.login, context);
            },
          ),
          InkWell(
            child: itemMenu(user.publicRepos.toString(), Icons.import_contacts,
                'public repository'),
            onTap: () {
              _selectRepository(user.login, context);
            },
          ),
          InkWell(
            child: itemMenu(user.location, Icons.location_on, 'location'),
            onTap: () {},
          ),
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

_selectRepository(String username, context) async {
  var response = await RepositoryNetworking.searchRepos(username);
  if (response != null) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => ListRepositories(response),
      ),
    );
  } else {
    return showDialog(
      builder: (BuildContext context) => CustomDialog(
        title: "Repository not found",
        description: "Repository not found",
        buttonText: "back",
      ),
      context: context,
    );
  }
}

_selectCompany(String username, context) async {
  var response = await RepositoryNetworking.searchRepos(username);
  if (response != null) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => ListRepositories(response),
      ),
    );
  } else {
    return showDialog(
      builder: (BuildContext context) => CustomDialog(
        title: "Repository not found",
        description: "Repository not found",
        buttonText: "back",
      ),
      context: context,
    );
  }
}
