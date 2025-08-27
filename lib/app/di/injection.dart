import 'package:flutter_init/app/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/print_logs.dart';
import '../env.dart';


final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  final config = EnvConfig.fromDotEnv();
  printLog("Running with $config", type: PrintType.INFO);

  sl.registerSingleton<EnvConfig>(EnvConfig.fromDotEnv());

  sl.init(environment: config.env.name);
}