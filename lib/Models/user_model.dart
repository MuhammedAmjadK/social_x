import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  String? id;
  final String name, email, password, contactNo;

  User(
      {this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.contactNo});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
