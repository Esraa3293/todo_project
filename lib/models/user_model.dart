class UserModel {
  String id;
  String name;
  String phone;
  String email;

  UserModel(
      {this.id = "",
      required this.name,
      required this.phone,
      required this.email});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
            email: json['email']);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "email": email,
    };
  }
}
