part of 'navigation.dart';

Route<dynamic>? Function(RouteSettings settings) onGenerateAppRoute(
  RoutesFactory routesFactory,
) {
  return (RouteSettings settings) {
    switch (settings.name) {
      case _homePageRouteName:
        return routesFactory.createHomePageRoute();
      case _settingsPageRouteName:
        return routesFactory.createSettingsPageRoute();
      case _faqPageRouteName:
        return routesFactory.createFaqPageRoute();
      default:
        return null;
    }
  };
}