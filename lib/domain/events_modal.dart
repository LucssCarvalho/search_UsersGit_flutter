import 'package:json_annotation/json_annotation.dart';

import 'actor_modal.dart';
import 'payload_modal.dart';
import 'repo_modal.dart';

part 'events_modal.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Events {
  String id;
  String type;
  Actor actor;
  Repo repo;
  Payload payload;
  bool public;
  String createdAt;

  Events(
      {this.id,
      this.type,
      this.actor,
      this.repo,
      this.payload,
      this.public,
      this.createdAt});
}
