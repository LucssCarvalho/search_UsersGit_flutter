import 'package:json_annotation/json_annotation.dart';

part 'repo_modal.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Repo {
  int id;
  String name;
  String url;

  Repo({this.id, this.name, this.url});

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
