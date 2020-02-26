// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commits_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commits _$CommitsFromJson(Map<String, dynamic> json) {
  return Commits(
    sha: json['sha'] as String,
    author: json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    message: json['message'] as String,
    distinct: json['distinct'] as bool,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$CommitsToJson(Commits instance) => <String, dynamic>{
      'sha': instance.sha,
      'author': instance.author?.toJson(),
      'message': instance.message,
      'distinct': instance.distinct,
      'url': instance.url,
    };
