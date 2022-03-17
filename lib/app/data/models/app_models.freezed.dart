// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusinessProfile _$BusinessClientProfileFromJson(Map<String, dynamic> json) {
  return _BusinessClientProfile.fromJson(json);
}

/// @nodoc
class _$BusinessClientProfileTearOff {
  const _$BusinessClientProfileTearOff();

  _BusinessClientProfile call(
      {required String name,
      required String industry,
      required String phoneNumber,
      required String homeAddress,
      required String country,
      required String region,
      required String city}) {
    return _BusinessClientProfile(
      name: name,
      industry: industry,
      phoneNumber: phoneNumber,
      homeAddress: homeAddress,
      country: country,
      region: region,
      city: city,
    );
  }

  BusinessProfile fromJson(Map<String, Object?> json) {
    return BusinessProfile.fromJson(json);
  }
}

/// @nodoc
const $BusinessClientProfile = _$BusinessClientProfileTearOff();

/// @nodoc
mixin _$BusinessClientProfile {
  String get name => throw _privateConstructorUsedError;
  String get industry => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get homeAddress => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessClientProfileCopyWith<BusinessProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessClientProfileCopyWith<$Res> {
  factory $BusinessClientProfileCopyWith(
          BusinessProfile value, $Res Function(BusinessProfile) then) =
      _$BusinessClientProfileCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String industry,
      String phoneNumber,
      String homeAddress,
      String country,
      String region,
      String city});
}

/// @nodoc
class _$BusinessClientProfileCopyWithImpl<$Res>
    implements $BusinessClientProfileCopyWith<$Res> {
  _$BusinessClientProfileCopyWithImpl(this._value, this._then);

  final BusinessProfile _value;
  // ignore: unused_field
  final $Res Function(BusinessProfile) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? industry = freezed,
    Object? phoneNumber = freezed,
    Object? homeAddress = freezed,
    Object? country = freezed,
    Object? region = freezed,
    Object? city = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      industry: industry == freezed
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      homeAddress: homeAddress == freezed
          ? _value.homeAddress
          : homeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BusinessClientProfileCopyWith<$Res>
    implements $BusinessClientProfileCopyWith<$Res> {
  factory _$BusinessClientProfileCopyWith(_BusinessClientProfile value,
          $Res Function(_BusinessClientProfile) then) =
      __$BusinessClientProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String industry,
      String phoneNumber,
      String homeAddress,
      String country,
      String region,
      String city});
}

/// @nodoc
class __$BusinessClientProfileCopyWithImpl<$Res>
    extends _$BusinessClientProfileCopyWithImpl<$Res>
    implements _$BusinessClientProfileCopyWith<$Res> {
  __$BusinessClientProfileCopyWithImpl(_BusinessClientProfile _value,
      $Res Function(_BusinessClientProfile) _then)
      : super(_value, (v) => _then(v as _BusinessClientProfile));

  @override
  _BusinessClientProfile get _value => super._value as _BusinessClientProfile;

  @override
  $Res call({
    Object? name = freezed,
    Object? industry = freezed,
    Object? phoneNumber = freezed,
    Object? homeAddress = freezed,
    Object? country = freezed,
    Object? region = freezed,
    Object? city = freezed,
  }) {
    return _then(_BusinessClientProfile(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      industry: industry == freezed
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      homeAddress: homeAddress == freezed
          ? _value.homeAddress
          : homeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BusinessClientProfile implements _BusinessClientProfile {
  _$_BusinessClientProfile(
      {required this.name,
      required this.industry,
      required this.phoneNumber,
      required this.homeAddress,
      required this.country,
      required this.region,
      required this.city});

  factory _$_BusinessClientProfile.fromJson(Map<String, dynamic> json) =>
      _$$_BusinessClientProfileFromJson(json);

  @override
  final String name;
  @override
  final String industry;
  @override
  final String phoneNumber;
  @override
  final String homeAddress;
  @override
  final String country;
  @override
  final String region;
  @override
  final String city;

  @override
  String toString() {
    return 'BusinessClientProfile(name: $name, industry: $industry, phoneNumber: $phoneNumber, homeAddress: $homeAddress, country: $country, region: $region, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessClientProfile &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.industry, industry) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.homeAddress, homeAddress) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.region, region) &&
            const DeepCollectionEquality().equals(other.city, city));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(industry),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(homeAddress),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(region),
      const DeepCollectionEquality().hash(city));

  @JsonKey(ignore: true)
  @override
  _$BusinessClientProfileCopyWith<_BusinessClientProfile> get copyWith =>
      __$BusinessClientProfileCopyWithImpl<_BusinessClientProfile>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusinessClientProfileToJson(this);
  }
}

abstract class _BusinessClientProfile implements BusinessProfile {
  factory _BusinessClientProfile(
      {required String name,
      required String industry,
      required String phoneNumber,
      required String homeAddress,
      required String country,
      required String region,
      required String city}) = _$_BusinessClientProfile;

  factory _BusinessClientProfile.fromJson(Map<String, dynamic> json) =
      _$_BusinessClientProfile.fromJson;

  @override
  String get name;
  @override
  String get industry;
  @override
  String get phoneNumber;
  @override
  String get homeAddress;
  @override
  String get country;
  @override
  String get region;
  @override
  String get city;
  @override
  @JsonKey(ignore: true)
  _$BusinessClientProfileCopyWith<_BusinessClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
