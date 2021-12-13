import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.name,
    required this.email,
    required this.image,
  });
  final String name, email, image;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.empty() => User(name: '', email: '', image: '');
  // ?User.fromJson({
  //       'full_name': '',
  //       'email': '',
  //       'image': '',
  //     });

  // User.fromJson(Map<String, dynamic> json) {
  //   print('User - fromJson is Called');
  //   email = json['email'];
  //   fullname = json['full_name'];
  //   image = json['image'];
  // }

  // Map<String, dynamic> toJson() {
  //   print('User - toJson is Called');
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   // data['id'] = id;
  //   data['email'] = email;
  //   data['full_name'] = fullname;
  //   data['image'] = image;
  //   return data;
  // }
}
