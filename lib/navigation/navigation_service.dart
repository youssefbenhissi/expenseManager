part of 'navigation.dart';

class NavigationService {
  Future<void> openHome(
    BuildContext context,
  ) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      _homePageRouteName,
      ModalRoute.withName('/'),
    );
  }

  Future<void> openSettings(
    BuildContext context,
  ) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      _settingsPageRouteName,
      ModalRoute.withName('/'),
    );
  }

  Future<void> openFaq(
    BuildContext context,
  ) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      _faqPageRouteName,
      ModalRoute.withName('/'),
    );
  }

  Future<void> openAccountProfile(
    BuildContext context,
  ) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      _accountProfilePageRouteName,
      ModalRoute.withName('/'),
    );
  }

  Future<void> openApplicationSettings(
    BuildContext context,
  ) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      _applicationSettingsPageRouteName,
      ModalRoute.withName('/'),
    );
  }
}
