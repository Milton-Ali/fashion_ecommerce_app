import 'package:fashion_ecommerce_app/core/theme/app_theme.dart';
import 'package:fashion_ecommerce_app/features/auth/presentation/pages/login_page.dart';
import 'package:fashion_ecommerce_app/features/auth/presentation/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          snapshot.hasData;
          if (snapshot.hasData) {
            return Scaffold(body: Center(child: Text('User Logged In')));
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
