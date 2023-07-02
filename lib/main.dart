import 'package:expense_manager/app_routes_factory.dart';
import 'package:expense_manager/login/auth.dart';
import 'package:expense_manager/login/new_login_page.dart';
import 'package:expense_manager/navigation/navigation.dart';
import 'package:expense_manager/services/service_locator.dart';
import 'package:expense_manager/theme/dark_theme.dart';
import 'package:expense_manager/theme/light_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:expense_manager/provider/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    FirebaseAuth.instance.signOut();
  }
  final locator = ServiceLocator()..config();

  runApp(
    MyApp(serviceLocator: locator),
  );
}

class MyApp extends StatefulWidget {
  final ServiceLocator serviceLocator;

  const MyApp({super.key, required this.serviceLocator});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: widget.serviceLocator),
          ],
          child: MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            supportedLocales: L10n.all,
            onGenerateRoute: onGenerateAppRoute(
              AppRoutesFactory(),
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: provider.locale,
            home: ShowCaseWidget(
              builder: Builder(builder: (context) => const Auth()),
            ),
          ),
        );
      });
}
