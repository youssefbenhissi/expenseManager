import 'package:expense_manager/login/login_page_route_builder.dart';
import 'package:expense_manager/settings/FAQ/faq_page_route_builder.dart';
import 'package:expense_manager/home/home_page_route_builder.dart';
import 'package:expense_manager/settings/account_profile/account_profile_page_route_builder.dart';
import 'package:expense_manager/settings/application_settings/application_settings_page_route_builder.dart';
import 'package:expense_manager/settings/contact_us/contact_us_page_builder.dart';
import 'package:expense_manager/settings/settings_page_route_builder.dart';
import 'package:expense_manager/settings/support_screen/chat_screen_route_builder.dart';
import 'package:expense_manager/signup/sign_up_page_route_builder.dart';
import 'package:flutter/material.dart';
import 'navigation/navigation.dart';

class AppRoutesFactory extends RoutesFactory {
  AppRoutesFactory();

  @override
  Route<dynamic> createHomePageRoute() {
    return MaterialPageRoute(
      builder: HomePageRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createSettingsPageRoute() {
    return MaterialPageRoute(
      builder: SettingsPageRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createFaqPageRoute() {
    return MaterialPageRoute(
      builder: FaqPageRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createAccountProfilePageRoute() {
    return MaterialPageRoute(
      builder: AccountProfilePageRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createApplicationSettingsPageRoute() {
    return MaterialPageRoute(
      builder: ApplicationSettingsPageRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createChatScreenPageRoute() {
    return MaterialPageRoute(
      builder: ChatScreenRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createContactUsPageRoute() {
    return MaterialPageRoute(
      builder: ContactUsPageRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createLoginPageRoute() {
    return MaterialPageRoute(
      builder: LoginPageRouteBuilder(),
    );
  }

  @override
  Route<dynamic> createSignUpPageRoute() {
    return MaterialPageRoute(
      builder: SignUpPageRouteBuilder(),
    );
  }
}
