import 'package:flutter/material.dart';
import 'package:github_users_flutter/domain/event_modal.dart';
import 'package:github_users_flutter/domain/user_modal.dart';
import 'package:github_users_flutter/helper/convert.dart';
import 'package:github_users_flutter/widgets/details_page_widgets.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class User_screen extends StatefulWidget {
  User newUser;
  List<Event> eventList;

  User_screen(this.newUser, this.eventList);
  @override
  _User_screenState createState() => _User_screenState();
}

class _User_screenState extends State<User_screen> {
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
              // _createEvents(),
              _createEventsList()
            ],
          ),
        ),
      ),
    );
  }

  _createEvents() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _createDay('Mon'),
              _createDay('Tue'),
              _createDay('Wed'),
              _createDay('Thu'),
              _createDay('Fri'),
              _createDay('Sat'),
              _createDay('Sun'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _createDevelopmentDay(),
            _createDevelopmentDay(),
            _createDevelopmentDay(),
            _createDevelopmentDay(),
            _createDevelopmentDay(),
            _createDevelopmentDay(),
            _createDevelopmentDay(),
          ],
        ),
      ],
    );
  }

  _createDay(day) {
    return (Container(
      alignment: AlignmentDirectional.center,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Text(day, style: TextStyle(fontSize: 20)),
    ));
  }

  _createDevelopmentDay() {
    return (Container(
      alignment: AlignmentDirectional.center,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.code,
          color: Colors.white,
        ),
      ),
    ));
  }

  _createEventsList() {
    convert_date converter = new convert_date();
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.eventList == null ? 0 : widget.eventList.length,
        itemBuilder: (BuildContext context, int index) {
          var event = widget.eventList[index];
          // .where((event) {
          //   return converter.convertDateFromString(event.createdAt) ==
          //       converter.convertDateFromString(
          //           DateTime.now().subtract(Duration(days: 1)).toString());
          // })
          // .take(7)
          // .toList();

          return Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
              top: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              height: 150,
              width: 100,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'event type',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(event.type),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Repository',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(event.repo.name),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'creation',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                              converter.convertDateFromString(event.createdAt)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
