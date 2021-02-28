import 'package:footyappp/app/core/services/http/http_service_impl.dart';
import 'package:get_it/get_it.dart';

import 'core/services/http/http_service.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator({bool test = false})async {
  // locator.registerLazySingleton<NavigationService>(
  //   () => NavigationService()
  // );
  // locator.registerLazySingleton<DialogService>(
  //   () => DialogService(),
  // );
  // locator.registerLazySingleton<SnackbarService>(
  //   () => SnackbarService(),
  // );
  locator.registerLazySingleton<HttpService>(
    () => HttpServiceImpl()
  );
}