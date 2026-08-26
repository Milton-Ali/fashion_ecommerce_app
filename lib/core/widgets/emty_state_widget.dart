import 'package:flutter/material.dart';

class EmtyStateWidget extends StatelessWidget {
  final String message;
  const EmtyStateWidget({super.key, this.message = 'No data found'});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
