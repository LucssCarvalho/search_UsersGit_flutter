import 'package:flutter/material.dart';
import 'package:github_users_flutter/domain/repository_modal.dart';
import 'package:github_users_flutter/domain/user_modal.dart';
import 'package:github_users_flutter/helper/language_color.dart';
import 'package:github_users_flutter/networking/repository_networking.dart';

class ListRepositories extends StatefulWidget {
  List<Repository> repositoriesList;
  ListRepositories(this.repositoriesList);

  @override
  _ListRepositoriesState createState() => _ListRepositoriesState();
}

class _ListRepositoriesState extends State<ListRepositories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('public repositories'),
        backgroundColor: Color(0xff24292E),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Column(
            children: <Widget>[
              _createRepositories(),
            ],
          ),
        ),
      ),
    );
  }

  _createRepositories() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.repositoriesList == null
            ? 0
            : widget.repositoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          var repository = widget.repositoriesList[index];
          return repositoryCard(repository);
        },
      ),
    );
  }

  repositoryCard(Repository repository) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.blueGrey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${repository.name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: Text(
                  '${repository.description == null ? 'description not defined' : repository.description}',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: colorList[repository.language],
                    radius: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                    ),
                    child: Text(
                      '${repository.language == null ? 'undefined language' : repository.language}',
                      overflow: TextOverflow.ellipsis,
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

  Future<List<Repository>> createQuotationsFuture(User newUser) async {
    Future response = RepositoryNetworking.searchRepos(newUser.login);

    return response;
  }
}
