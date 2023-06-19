import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../navigation/navigation.dart';

class ServiceLocator {
  final GetIt _registry;

  ServiceLocator() : _registry = GetIt.asNewInstance();

  NavigationService get navigationService => _registry.get<NavigationService>();
  void config() {
    _registry.registerLazySingleton(
      () => NavigationService(),
    );
  }
}
