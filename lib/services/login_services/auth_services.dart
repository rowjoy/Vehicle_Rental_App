import 'dart:async';

// I do not create a mockup API service here, just a mockup for demonstration purposes.


class AuthService {
  static Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 3)); // simulate delay
    if (email == 'user@example.com' && password == '123456') {
      return {
        'token': 'abc123',
        'user': {
          'id': 1,
          'name': 'John Doe',
          'email': 'user@example.com',
        }
      };
    } else {
      throw Exception('Email or password did not match');
    }
  }
}



class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

