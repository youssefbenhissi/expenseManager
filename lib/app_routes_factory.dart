import 'package:expense_manager/home/home_page_route_builder.dart';
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
}
