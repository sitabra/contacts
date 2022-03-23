import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post {
  Post({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.username,
    required this.street,
  });

  int id;
  String name;
  String email;
  String phone;
  String website;
  String username;
  String street;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    website: json["website"],
    username: json["username"],
    street: json["street"],
  );
}