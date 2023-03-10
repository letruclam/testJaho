import 'package:json_annotation/json_annotation.dart';
part 'ModelList.g.dart';
@JsonSerializable()

class ListDataHome {
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "avatar")
  String? image;

  ListDataHome({this.email, this.lastName, this.image});

  factory ListDataHome.fromJson(Map<String, dynamic> json) => _$ListDataHomeFromJson(json);

  Map<String, dynamic> toJson() => _$ListDataHomeToJson(this);
}