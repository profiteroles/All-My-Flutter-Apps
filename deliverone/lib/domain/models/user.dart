import '../../path.dart';

class User {
  const User({
    required this.name,
    required this.email,
    this.image = IMAGE_PATH + 'logo.png',
  });

  final String name, email;
  final String image;

  factory User.empty() => User(name: 'placeholder', email: 'placeholder');
}
