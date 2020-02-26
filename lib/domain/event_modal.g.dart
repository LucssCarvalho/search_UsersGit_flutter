// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    id: json['id'] as String,
    type: json['type'] as String,
    actor: json['actor'] == null
        ? null
        : Actor.fromJson(json['actor'] as Map<String, dynamic>),
    repo: json['repo'] == null
        ? null
        : Repo.fromJson(json['repo'] as Map<String, dynamic>),
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
    public: json['public'] as bool,
    createdAt: json['created_at'] as String,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'actor': instance.actor?.toJson(),
      'repo': instance.repo?.toJson(),
      'payload': instance.payload?.toJson(),
      'public': instance.public,
      'created_at': instance.createdAt,
    };
