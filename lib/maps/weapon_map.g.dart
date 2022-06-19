// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weapon _$WeaponFromJson(Map<String, dynamic> json) => Weapon(
      json['image_url'] as String,
      json['key'] as String,
      json['name'] as String,
      json['type'] as String?,
    );

Map<String, dynamic> _$WeaponToJson(Weapon instance) => <String, dynamic>{
      'image_url': instance.imageUrl,
      'key': instance.key,
      'type': instance.type,
      'name': instance.name,
    };
