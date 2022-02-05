class User {
  final String imagePath;
  final String name;
  final String email;
  final String birthday;
  final String password;
  final bool isDarkMood;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.birthday,
    required this.password,
    required this.isDarkMood,
  });
}