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
  List<Repository> repositories;
  Future<List<Repository>> _quotationsFuture;
  TextEditingController userNameController = TextEditingController();

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
                      controller: userNameController,
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
                          if (_formKey.currentState.validate()) {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => DetailPage(repositories),
                              ),
                            );
                          }
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

  _selectDate(username) async {
    var response = await RepositoryNetworking.searchRepos(username);
    setState(() {
      repositories = response;
    });
  }

  Future<List<Repository>> searchRepos() async {
    var user = RepositoryNetworking.searchRepos(username);
    print(user);
    return user;
  }
}

class DetailPage extends StatefulWidget {
  Future<List<Repository>> _quotationsFuture;
  List<Repository> listRespo;
  DetailPage(this.listRespo);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _createListQuotation(),
      ),
    );
  }

  _createListQuotation() {
    return FutureBuilder<List<Repository>>(
      future: widget._quotationsFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(child: CircularProgressIndicator()),
            );
          default:
            if (snapshot.hasError) {
              return new Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.data != null) {
                widget.listRespo.toList();
              }

              if (snapshot.data == null ||
                  widget.listRespo == null ||
                  widget.listRespo.length == 0) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child:
                      new Text('Nenhum pagamento encontrado para esta data!'),
                ));
              }

              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:
                      widget.listRespo == null ? 0 : widget.listRespo.length,
                  itemBuilder: (BuildContext context, int index) {
                    var respo = widget.listRespo[index];
                    return Text('${respo.id}');
                  },
                ),
              );
            }
        }
      },
    );
  }
}
