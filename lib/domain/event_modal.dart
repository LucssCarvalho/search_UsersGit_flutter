import 'package:json_annotation/json_annotation.dart';

import 'actor_modal.dart';
import 'payload_modal.dart';
import 'repo_modal.dart';

part 'event_modal.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Event {
  String id;
  String type;
  Actor actor;
  Repo repo;
  Payload payload;
  bool public;
  String createdAt;

  Event(
      {this.id,
      this.type,
      this.actor,
      this.repo,
      this.payload,
      this.public,
      this.createdAt});
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
