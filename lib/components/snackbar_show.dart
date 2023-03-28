import 'package:flutter/Material.dart';

ScaffoldFeatureController snackBarGoster(BuildContext context, message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.white,
      content: Text(message,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold))));
}
