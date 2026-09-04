import 'package:fashion_ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fashion_ecommerce_app/app.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(App());
}
