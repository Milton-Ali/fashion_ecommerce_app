import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  const ErrorStateWidget({super.key, this.message = 'Something went wrong'});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
