// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operator _$OperatorFromJson(Map<String, dynamic> json) => Operator(
      json['armor'] as int,
      json['speed'] as int,
      OperatorBio.fromJson(json['bio'] as Map<String, dynamic>),
      json['name'] as String?,
      json['icon_url'] as String,
      json['key'] as String,
    );

Map<String, dynamic> _$OperatorToJson(Operator instance) => <String, dynamic>{
      'armor': instance.armor,
      'speed': instance.speed,
      'bio': instance.bio,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'key': instance.key,
    };
