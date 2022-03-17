import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_models.freezed.dart';
part 'app_models.g.dart';

@JsonSerializable()
class BusinessProfileDTO {
  BusinessProfileDTO({
    required this.name,
    required this.industry,
    required this.phoneNumber,
    required this.homeAddress,
    required this.country,
    required this.region,
    required this.city,
  });

  String name;
  String industry;
  String phoneNumber;
  String homeAddress;
  String country;
  String region;
  String city;

  factory BusinessProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$BusinessProfileDTOFromJson(json);
}

@freezed
class BusinessProfile with _$BusinessClientProfile {
  factory BusinessProfile({
    required String name,
    required String industry,
    required String phoneNumber,
    required String homeAddress,
    required String country,
    required String region,
    required String city,
  }) = _BusinessClientProfile;

  factory BusinessProfile.fromJson(Map<String, dynamic> json) =>
      _$BusinessClientProfileFromJson(json);
}
