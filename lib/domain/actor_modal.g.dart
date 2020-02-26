// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return Actor(
    id: json['id'] as int,
    login: json['login'] as String,
    displayLogin: json['display_login'] as String,
    gravatarId: json['gravatar_id'] as String,
    url: json['url'] as String,
    avatarUrl: json['avatar_url'] as String,
  );
}

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'display_login': instance.displayLogin,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'avatar_url': instance.avatarUrl,
    };
