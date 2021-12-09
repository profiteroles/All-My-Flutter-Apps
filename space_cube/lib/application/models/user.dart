class User {
  const User({
    required this.name,
    required this.email,
    this.image,
  });

  final String name, email;
  final String? image;

  factory User.empty() => User(name: 'placeholder', email: 'placeholder');
}
