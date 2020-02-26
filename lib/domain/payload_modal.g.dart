// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return Payload(
    pushId: json['push_id'] as int,
    size: json['size'] as int,
    distinctSize: json['distinct_size'] as int,
    ref: json['ref'] as String,
    head: json['head'] as String,
    before: json['before'] as String,
    commits: (json['commits'] as List)
        ?.map((e) =>
            e == null ? null : Commits.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'push_id': instance.pushId,
      'size': instance.size,
      'distinct_size': instance.distinctSize,
      'ref': instance.ref,
      'head': instance.head,
      'before': instance.before,
      'commits': instance.commits?.map((e) => e?.toJson())?.toList(),
    };
