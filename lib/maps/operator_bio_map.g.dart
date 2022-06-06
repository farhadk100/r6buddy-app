// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_bio_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperatorBio _$OperatorBioFromJson(Map<String, dynamic> json) => OperatorBio(
      json['bio'] as String,
      json['date_of_birth'] as String,
      json['place_of_birth'] as String,
      json['real_name'] as String,
    );

Map<String, dynamic> _$OperatorBioToJson(OperatorBio instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'date_of_birth': instance.dateOfBirth,
      'place_of_birth': instance.placeOfBirth,
      'real_name': instance.realName,
    };
