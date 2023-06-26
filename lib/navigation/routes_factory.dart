part of 'navigation.dart';

abstract class RoutesFactory {
  Route<dynamic> createHomePageRoute();
  Route<dynamic> createSettingsPageRoute();
  Route<dynamic> createFaqPageRoute();
  Route<dynamic> createAccountProfilePageRoute();
  Route<dynamic> createApplicationSettingsPageRoute();
}
