import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_init/core/utils/print_logs.dart';

import 'app/app.dart';
import 'app/di/injection.dart';
import 'app/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env.dev");

  await configureDependencies();

  runApp(const MyApp());
}
