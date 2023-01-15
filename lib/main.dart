import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sheff_new/data/repo/product_repository.dart';
import 'package:sheff_new/layout/profileDrawer.dart';
import 'package:sheff_new/pages/auth.dart';
import 'package:sheff_new/pages/authUp.dart';
import 'package:sheff_new/pages/booksScreen.dart';
import 'package:sheff_new/pages/ordersScreen.dart';
import 'package:sheff_new/pages/root.dart';
import 'package:sheff_new/pages/splash.dart';
import 'layout/drawer.dart';
import 'pages/aboutUs.dart';
import 'pages/americanScreen.dart';
import 'pages/becomeChef.dart';
import 'pages/booksScreen.dart';
import 'pages/cartScreen.dart';
import 'pages/chef.dart';
import 'pages/homeScreen.dart';
import 'pages/iranianScreen.dart';
import 'pages/japaneseScreen.dart';
import 'pages/loginScreen.dart';
import 'pages/personScreen.dart';
import 'pages/privacyScreen.dart';
import 'pages/profileScreen.dart';
import 'pages/searchScreen.dart';
import 'pages/servicesScreen.dart';
import 'pages/signUpScreen.dart';
import 'pages/startScreen.dart';

void main() async {
  await Hive.initFlutter();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Brandon';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    const MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
    const primaryTextColor = Colors.black87;
    const secondaryTextColor = Color(0xff757575);
    const thirdTextColor = Colors.white;
    const primaryColor = Colors.deepOrange;
    const secondaryColor = Color(0xFFFBE9E7);
    return MaterialApp(
      routes: {
        '/start': (context) => const StartScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignUpScreen(),
        "/services": (context) => const ServicesScreen(),
        "/search": (context) => const SearchScreen(),
        "/privacy": (context) => const PrivacyScreen(),
        "/home": (context) => const HomeScreen(),
        "/cart": (context) => const CartScreen(),
        "/person": (context) => const PersonScreen(),
        "/profile": (context) => const ProfileScreen(),
        "/iranian": (context) => const IranianScreen(),
        "/japanese": (context) => JapaneseScreen(),
        "/american": (context) => AmericanScreen(),
        "/drawer": (context) => const DrawerWidget(),
        "/become": (context) => const BecomeChefScreen(),
        "/chef": (context) => const ChefScreen(),
        // "/about": (context) => const AboutUsScreen(),
        "/splash": (context) => const SplashScreen(),
        "/orders": (context) => const OrdersScreen(),
        "/books": (context) => BooksScreen(),
        "/profileDrawer": (context) => const ProfileDrawer(),

      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('fa', ''), // Spanish, no country code
      ],
      locale: const Locale('en'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.deepOrange,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelStyle: themeData.textTheme.subtitle2,
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w600,
            color: thirdTextColor,
            fontSize: 22,
          ),
          headline4: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.bold,
            color: primaryColor,
            fontSize: 34,
          ),
          headline5: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.bold,
            color: thirdTextColor,
            fontSize: 26,
          ),
          headline3: TextStyle(fontFamily: defaultFontFamily),
          subtitle1: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 19,
            color: primaryTextColor,
          ),
          bodyText1: TextStyle(
            fontFamily: defaultFontFamily,
            color: secondaryTextColor,
            fontSize: 19,
          ),
          subtitle2: TextStyle(
            fontFamily: defaultFontFamily,
            color: secondaryTextColor,
            fontSize: 17,
          ),
          bodyText2: TextStyle(
            fontFamily: defaultFontFamily,
            color: primaryTextColor,
            fontSize: 17,
          ),
          caption: TextStyle(fontFamily: defaultFontFamily, fontSize: 15),
        ),
      ),
      home:  const RootScreen(),
    );
  }
}
