import 'package:json_annotation/json_annotation.dart';
part "api_error_model.g.dart";
// The part "api_error_model.g.dart"; statement indicates that the code
//generation for JSON serialization/deserialization will be handled in a
//separate file api_error_model.g.dart.

@JsonSerializable()
// It includes @JsonSerializable() annotation, indicating that instances of this
// class can be serialized and deserialized to/from JSON.
class ApiErrorModel {
  // class ApiErrorModel that represents an API error response. It uses the
  // json_annotation package for JSON serialization.
  final String? message;
  final int? code;
  // The ApiErrorModel class has two fields: message of type String? and code
  //of type int?. These fields represent the error message and error code,
  // respectively.

  ApiErrorModel({
    required this.message,
    required this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
// The fromJson factory method is used to create an ApiErrorModel instance from
// a JSON object. It handles the deserialization process to the generated
//method _$ApiErrorModelFromJson.
  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
  // The toJson method converts an ApiErrorModel instance to a JSON object.
  //It uses the generated method _$ApiErrorModelToJson for serialization.
}
