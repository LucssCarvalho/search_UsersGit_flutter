import 'package:json_annotation/json_annotation.dart';

part 'actor_modal.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Actor {
  int id;
  String login;
  String displayLogin;
  String gravatarId;
  String url;
  String avatarUrl;

  Actor(
      {this.id,
      this.login,
      this.displayLogin,
      this.gravatarId,
      this.url,
      this.avatarUrl});
  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}
