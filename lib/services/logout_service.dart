// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:topcoder_hackathon/screens/login.dart';
import 'package:topcoder_hackathon/services/login_service.dart';

LogoutUser logoutUserFromJson(String str) =>
    LogoutUser.fromJson(json.decode(str));

String logoutUserToJson(LogoutUser data) => json.encode(data.toJson());

class LogoutUser {
  bool status;
  String message;

  LogoutUser({
    required this.status,
    required this.message,
  });

  factory LogoutUser.fromJson(Map<String, dynamic> json) => LogoutUser(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}

// This function logs out the user by sending a POST request to the server.
Future logout(BuildContext context) async {
  try {
    final bearertoken = await retrieveToken();
    final response = await http.post(
      Uri.parse("https://server.rebanker.co.ke/api/logout"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': bearertoken.toString(),
      },
    );
    if (response.statusCode == 200) {
      // Delete the token from the secure storage on successful logout
      retrieveToken().then((value) => tokenStorage.delete(key: 'accessToken'));

      return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false,
      );
    } else {
      var error = ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Unable to logout. Please try again.',
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
    throw Exception('Failed to logout user: $e');
  }
}
