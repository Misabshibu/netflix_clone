import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netfix_clone/domain/core/di/injectable.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}
