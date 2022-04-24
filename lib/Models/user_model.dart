import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  final String name, email, password, contactNo;

  UserModel(
      {this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.contactNo});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
