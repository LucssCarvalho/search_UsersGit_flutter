import 'package:json_annotation/json_annotation.dart';

part 'company_modal.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Company {
  String login;
  int id;
  String nodeId;
  String url;
  String reposUrl;
  String eventsUrl;
  String hooksUrl;
  String issuesUrl;
  String membersUrl;
  String publicMembersUrl;
  String avatarUrl;
  String description;
  String name;
  String company;
  String blog;
  String location;
  String email;
  bool isVerified;
  bool hasOrganizationProjects;
  bool hasRepositoryProjects;
  int publicRepos;
  int publicGists;
  int followers;
  int following;
  String htmlUrl;
  String createdAt;
  String updatedAt;
  String type;

  Company(
      {this.login,
      this.id,
      this.nodeId,
      this.url,
      this.reposUrl,
      this.eventsUrl,
      this.hooksUrl,
      this.issuesUrl,
      this.membersUrl,
      this.publicMembersUrl,
      this.avatarUrl,
      this.description,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.isVerified,
      this.hasOrganizationProjects,
      this.hasRepositoryProjects,
      this.publicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.htmlUrl,
      this.createdAt,
      this.updatedAt,
      this.type});
}
