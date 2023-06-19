import 'package:expense_manager/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation/navigation.dart';

extension AppPageInjectable on BuildContext {
  NavigationService get gNavigationService =>
      read<ServiceLocator>().navigationService;
}
