import 'dart:convert';

class RegisterRequestModel {
  final String name;
  final String password;
  final String email;
  final String username;

  RegisterRequestModel({
    required this.name,
    required this.password,
    required this.email,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'username': username,
    };
  }

  String toJson() => json.encode(toMap());
}
