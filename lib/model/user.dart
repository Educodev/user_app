class User {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      website: json["website"]);
}
