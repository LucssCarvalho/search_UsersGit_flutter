import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../domain/company_modal.dart';
import '../domain/company_modal.dart';

class Company_screen extends StatefulWidget {
  Company newCompany;
  Company_screen(this.newCompany);
  @override
  _Company_screenState createState() => _Company_screenState();
}

class _Company_screenState extends State<Company_screen> {
  var dateFormat = new DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('company'),
        backgroundColor: Color(0xff24292E),
      ),
      body: Center(
        child: _createCompany(),
      ),
    );
  }

  _createCompany() {
    Company company = widget.newCompany;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
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
                        color: Colors.grey[900],
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      '${company.name != null ? company.name : 'no name defined'}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              labelDescription(company.description),
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 45, top: 10),
                child: Column(
                  children: <Widget>[
                    label(Icons.cake,
                        'creation: ${(DateFormat("yyyy-MM-dd").parse(company.createdAt))}'),
                    label(Icons.import_contacts,
                        'publics repositories: ${company.publicRepos}'),
                    label(Icons.person, 'mail: ${company.email}'),
                    label(Icons.public, 'blog: ${company.blog}'),
                    label(Icons.location_on, 'location: ${company.location}'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget labelDescription(String description) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    width: 300,
    padding: EdgeInsets.all(20),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              description == '' || null ? 'without description' : description),
        ),
      ],
    ),
  );
}

Widget label(IconData labelIcon, String label) {
  return Padding(
    padding: EdgeInsets.only(top: 8),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(labelIcon),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  label == null ? 'data not recorded by the company' : label),
            ),
          ],
        ),
        Divider(),
      ],
    ),
  );
}
