class User {
  String imagePath;
  String name;
  String email;
  String about;

  User(
      {required this.imagePath,
      required this.name,
      required this.email,
      required this.about});

  User.fromJson(Map<String, dynamic> json)
      : this(
            imagePath: json['imagePath'],
            name: json['name'],
            email: json['email'],
            about: json['about']);

  Map<String, dynamic> toJson() {
    return {
      "imagePath": imagePath,
      "name": name,
      "email": email,
      "about": about,
    };
  }
}
