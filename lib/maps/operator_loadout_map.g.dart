// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_loadout_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperatorLoadout _$OperatorLoadoutFromJson(Map<String, dynamic> json) =>
    OperatorLoadout(
      (json['gadgets'] as List<dynamic>)
          .map((e) => Gadget.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['primary_weapons'] as List<dynamic>)
          .map((e) => Weapon.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['secondary_weapons'] as List<dynamic>)
          .map((e) => Weapon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OperatorLoadoutToJson(OperatorLoadout instance) =>
    <String, dynamic>{
      'gadgets': instance.gadgets,
      'primary_weapons': instance.primaryWeapons,
      'secondary_weapons': instance.secondaryWeapons,
    };
