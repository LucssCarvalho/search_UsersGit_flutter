import 'package:github_users_flutter/domain/author_modal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commits_modal.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Commits {
  String sha;
  Author author;
  String message;
  bool distinct;
  String url;

  Commits({this.sha, this.author, this.message, this.distinct, this.url});

  factory Commits.fromJson(Map<String, dynamic> json) =>
      _$CommitsFromJson(json);

  Map<String, dynamic> toJson() => _$CommitsToJson(this);
}
