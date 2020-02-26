import 'commits_modal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payload_modal.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Payload {
  int pushId;
  int size;
  int distinctSize;
  String ref;
  String head;
  String before;
  List<Commits> commits;

  Payload(
      {this.pushId,
      this.size,
      this.distinctSize,
      this.ref,
      this.head,
      this.before,
      this.commits});

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}
