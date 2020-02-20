import 'package:json_annotation/json_annotation.dart';

part 'license_modal.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class License {
  String key;
  String name;
  String spdxId;
  String url;
  String nodeId;

  License({this.key, this.name, this.spdxId, this.url, this.nodeId});

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}
