import 'package:fashion_ecommerce_app/core/theme/app_theme.dart';
import 'package:fashion_ecommerce_app/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const SplashPage()},
    );
  }
}
