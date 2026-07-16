import 'package:ecommerce/core/di/get_it.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
 Future<void> configureDependencies() => getIt.init();
