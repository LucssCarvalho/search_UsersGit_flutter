import 'package:flutter/material.dart';
import 'package:github_users_flutter/domain/user_modal.dart';
import 'package:github_users_flutter/widgets/details_page_widgets.dart';

import '../domain/company_modal.dart';
import '../domain/company_modal.dart';

class Company_screen extends StatefulWidget {
  Company newCompany;
  Company_screen(this.newCompany);
  @override
  _Company_screenState createState() => _Company_screenState();
}

class _Company_screenState extends State<Company_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff24292E),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _createCompany(),
          ],
        ),
      ),
    );
  }

  _createCompany() {
    Company company = widget.newCompany;
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
                      padding: const EdgeInsets.only(top: 30.0),
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage("${company.avatarUrl}"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Text(
                      '${company.login}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      '${company.name != null ? company.name : 'no name defined'}',
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
          cardDataUser(company, context),
        ],
      ),
    );
  }
}
