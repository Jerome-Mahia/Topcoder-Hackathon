// ignore_for_file: use_build_context_synchronously, avoid_print, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:topcoder_hackathon/constants/link_constants.dart';
import 'package:topcoder_hackathon/screens/dashboard.dart';

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));

String loginUserToJson(LoginUser data) => json.encode(data.toJson());

class LoginUser {
  bool status;
  String message;
  String accessToken;
  String role;

  LoginUser({
    required this.status,
    required this.message,
    required this.accessToken,
    required this.role,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        status: json["status"],
        message: json["message"],
        accessToken: json["access_token"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "access_token": accessToken,
        "role": role,
      };
}

// Create secure token storage for storing the token
final tokenStorage = FlutterSecureStorage();
Future<String> retrieveToken() async {
  String? value = await tokenStorage.read(key: 'accessToken');
  return value.toString();
}

// This function logs in the user by sending a POST request to the server.
Future login(BuildContext context, String username, String password) async {
  try {
    String base = baseUri;
    String login = loginUri;
    final response = await http.post(
      Uri.parse("$base$login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'password': password,
      }),
    );

    String result = jsonDecode(response.body)['message'];
    if (response.statusCode == 200) {
      final Map<String, dynamic> userResult = jsonDecode(response.body);
      var token = userResult['access_token'];

      // Store token in secure storage on successful login
      await tokenStorage.write(key: 'accessToken', value: token);

      var fullName = userResult['fullname'];
      var username = userResult['username'];

      return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(
            fullName: fullName,
            userName: username,
          ),
        ),
        (route) => false,
      );
    } else if (result == "Invalid Login credentials") {
      var error = ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Invalid Login credentials',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.width * 0.02),
            ),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return error;
    } else {
      var error = ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Failed to Login User',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.width * 0.02),
            ),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return error;
    }
  } catch (e) {
    print(e.toString());
    throw Exception('Failed to Login User: $e');
  }
}
