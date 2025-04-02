import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()

class LoginModel {
  final String cin;
  final String password;

  LoginModel({required this.cin, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
