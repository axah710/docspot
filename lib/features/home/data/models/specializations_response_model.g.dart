// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specializations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationsResponseModel _$SpecializationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    SpecializationsResponseModel(
      specializationDataList: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SpecializationsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationsResponseModelToJson(
        SpecializationsResponseModel instance) =>
    <String, dynamic>{
      'data': instance.specializationDataList,
    };

SpecializationsData _$SpecializationsDataFromJson(Map<String, dynamic> json) =>
    SpecializationsData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      doctorsList: (json['doctors'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : DoctorsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationsDataToJson(
        SpecializationsData instance) =>
    <String, dynamic>{
      'doctors': instance.doctorsList,
      'id': instance.id,
      'name': instance.name,
    };

DoctorsModel _$DoctorsModelFromJson(Map<String, dynamic> json) => DoctorsModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      gender: json['gender'] as String?,
      price: (json['appoint_price'] as num?)?.toInt(),
      degree: json['degree'] as String,
    );

Map<String, dynamic> _$DoctorsModelToJson(DoctorsModel instance) =>
    <String, dynamic>{
      'degree': instance.degree,
      'email': instance.email,
      'gender': instance.gender,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'photo': instance.photo,
      'appoint_price': instance.price,
    };
