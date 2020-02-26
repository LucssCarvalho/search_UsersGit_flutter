// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    email: json['email'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
    };
