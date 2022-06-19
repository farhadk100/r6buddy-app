// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operator _$OperatorFromJson(Map<String, dynamic> json) => Operator(
      json['armor'] as int,
      json['speed'] as int,
      OperatorBio.fromJson(json['bio'] as Map<String, dynamic>),
      $enumDecode(_$OperatorTypeEnumMap, json['type']),
      OperatorLoadout.fromJson(json['loadout'] as Map<String, dynamic>),
      json['name'] as String,
      json['icon_url'] as String,
      json['portrait_url'] as String,
      json['key'] as String,
    );

Map<String, dynamic> _$OperatorToJson(Operator instance) => <String, dynamic>{
      'armor': instance.armor,
      'speed': instance.speed,
      'type': _$OperatorTypeEnumMap[instance.type],
      'bio': instance.bio,
      'loadout': instance.loadout,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'portrait_url': instance.portraitUrl,
      'key': instance.key,
    };

const _$OperatorTypeEnumMap = {
  OperatorType.Attacker: 'Attacker',
  OperatorType.Defender: 'Defender',
};
