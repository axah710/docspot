import 'package:json_annotation/json_annotation.dart';

part 'specializations_response_model.g.dart';

@JsonSerializable()
class SpecializationsResponseModel {
  SpecializationsResponseModel({
    this.specializationDataList,
  });

  factory SpecializationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsResponseModelFromJson(json);

  @JsonKey(name: 'data')
  List<SpecializationsData?>? specializationDataList;
}

@JsonSerializable()
class SpecializationsData {
  SpecializationsData({
    this.id,
    this.name,
    this.doctorsList,
  });

  factory SpecializationsData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsDataFromJson(json);

  @JsonKey(name: 'doctors')
  List<DoctorsModel?>? doctorsList;

  int? id;
  String? name;
}

@JsonSerializable()
class DoctorsModel {
  DoctorsModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.price,
    required this.degree,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsModelFromJson(json);

  String degree;
  String? email;
  String? gender;
  int? id;
  String? name;
  String? phone;
  String? photo;
  @JsonKey(name: 'appoint_price')
  int? price;
}
