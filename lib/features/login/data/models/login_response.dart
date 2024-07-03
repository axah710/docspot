import 'package:json_annotation/json_annotation.dart';

part '../login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String message;
  //  Defines a field for the login response message.
  @JsonKey(name: 'data')
  final Data userData;
  // Defines a field that holds a Data object.
  // @JsonKey(name: 'data') final Data userData;: This field holds a Data
  //object, and it is mapped to the data key in the JSON.
  final bool status;
  // Defines a field for the status of the login response.
  final int code;
  //  Defines a field for the status code of the login response.

  LoginResponse({
    required this.message,
    required this.userData,
    required this.status,
    required this.code,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  // A factory constructor to create a LoginResponse instance from a
  //JSON map.

}
// Contains fields message, data, status, and code.
// Includes fromJson and toJson methods for JSON serialization and deserialization.
// Annotated with @JsonSerializable() to enable JSON serialization.

@JsonSerializable()
class Data {
  final String token;
  // Defines a field for the token.
  @JsonKey(name: 'username')
  final String userName;
  // Defines a field for the username.
  // @JsonKey(name: 'username') final String userName;: This field holds the
  // username and is mapped to the username key in the JSON.

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data({required this.token, required this.userName});
//  A factory constructor to create a Data instance from a JSON map.

}
// Contains fields token and username.
// Has a constructor that initializes these fields.
// Includes fromJson and toJson methods for JSON serialization and deserialization.
// Annotated with @JsonSerializable() for JSON serialization.
/// .......................................
// This Dart code snippet defines two classes LoginResponse and Data that are
//used for handling JSON serialization and deserialization using the
// json_annotation package.
// The LoginResponse class represents the response from a login request,
// while the Data class represents the response from a data request.
// Both classes are annotated with @JsonSerializable() to enable JSON serialization.
