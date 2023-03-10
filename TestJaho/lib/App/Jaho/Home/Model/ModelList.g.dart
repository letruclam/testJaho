// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListDataHome _$ListDataHomeFromJson(Map<String, dynamic> json) => ListDataHome(
      email: json['email'] as String?,
      lastName: json['last_name'] as String?,
      image: json['avatar'] as String?,
    )..firstName = json['first_name'] as String?;

Map<String, dynamic> _$ListDataHomeToJson(ListDataHome instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.image,
    };
