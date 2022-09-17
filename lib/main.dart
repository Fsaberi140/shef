import 'package:flutter/material.dart';
import 'pages/cartScreen.dart';
import 'layout/drawer.dart';
import 'pages/startScreen.dart';
import 'pages/homeScreen.dart';
import 'pages/searchScreen.dart';
import 'layout/appBar.dart';
import 'pages/bottomBar.dart';
import 'pages/loginScreen.dart';
import 'pages/personScreen.dart';
import 'pages/profileScreen.dart';
import 'pages/signUpScreen.dart';
import 'pages/iranianScreen.dart';
import 'pages/japaneseScreen.dart';
import 'pages/americanScreen.dart';
import 'pages/add.dart';
import 'pages/basketScreen.dart';
import 'pages/becomeChef.dart';
import 'pages/servicesScreen.dart';
import 'pages/privacyScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/videoWidget.dart';
import 'pages/test.dart';
import 'pages/chef.dart';
import 'pages/aboutUs.dart';

// import 'package:responsive_framework/responsive_framework.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Brandon';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
    const primaryTextColor = Colors.black87;
    const secondaryTextColor = Colors.black54;
    const thirdTextColor = Colors.deepOrange;
    const fourTextColor = Colors.white;
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
        "/about": (context) => const AboutUsScreen(),
      },
      // builder: (context, widget) => ResponsiveWrapper.builder(
      //   ClampingScrollWrapper.builder(context, widget!),
      //
      //     maxWidth: 1200,
      //     minWidth: 480,
      //     defaultScale: true,
      //     breakpoints: [
      //       const ResponsiveBreakpoint.resize(480, name: MOBILE),
      //       const ResponsiveBreakpoint.autoScale(800, name: TABLET),
      //       const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      //
      //     ],
      //     background: Container(color: const Color(0xFFF5F5F5))),
      // initialRoute: "/",
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
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w600,
            color: fourTextColor,
            fontSize: 22,

          ),
          headline4: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.bold,
            color: thirdTextColor,
            fontSize: 34,
          ),
          headline5: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.bold,
            color: fourTextColor,
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
      home: StartScreen(),
    );
  }
}
