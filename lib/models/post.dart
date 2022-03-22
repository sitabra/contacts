import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post {
  Post({
    required this.id,
    required this.name,
    required this.email,
  });

  int id;
  String name;
  String email;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );
}