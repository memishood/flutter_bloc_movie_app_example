import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc_movie_app_example/app/app.dart';
import 'package:flutter_bloc_movie_app_example/core/di/service_locator.dart'
    as locator;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env');
  locator.setUp();
  runApp(const App());
}
