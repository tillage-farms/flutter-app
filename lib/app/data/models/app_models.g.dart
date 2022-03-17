// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessProfileDTO _$BusinessProfileDTOFromJson(Map<String, dynamic> json) =>
    BusinessProfileDTO(
      name: json['name'] as String,
      industry: json['industry'] as String,
      phoneNumber: json['phoneNumber'] as String,
      homeAddress: json['homeAddress'] as String,
      country: json['country'] as String,
      region: json['region'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$BusinessProfileDTOToJson(BusinessProfileDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'industry': instance.industry,
      'phoneNumber': instance.phoneNumber,
      'homeAddress': instance.homeAddress,
      'country': instance.country,
      'region': instance.region,
      'city': instance.city,
    };

_$_BusinessClientProfile _$$_BusinessClientProfileFromJson(
        Map<String, dynamic> json) =>
    _$_BusinessClientProfile(
      name: json['name'] as String,
      industry: json['industry'] as String,
      phoneNumber: json['phoneNumber'] as String,
      homeAddress: json['homeAddress'] as String,
      country: json['country'] as String,
      region: json['region'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$_BusinessClientProfileToJson(
        _$_BusinessClientProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'industry': instance.industry,
      'phoneNumber': instance.phoneNumber,
      'homeAddress': instance.homeAddress,
      'country': instance.country,
      'region': instance.region,
      'city': instance.city,
    };
