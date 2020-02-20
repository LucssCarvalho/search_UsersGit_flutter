// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

License _$LicenseFromJson(Map<String, dynamic> json) {
  return License(
    key: json['key'] as String,
    name: json['name'] as String,
    spdxId: json['spdx_id'] as String,
    url: json['url'] as String,
    nodeId: json['node_id'] as String,
  );
}

Map<String, dynamic> _$LicenseToJson(License instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'spdx_id': instance.spdxId,
      'url': instance.url,
      'node_id': instance.nodeId,
    };
