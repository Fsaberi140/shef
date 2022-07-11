import 'package:flutter/material.dart';
import 'pages/cartScreen.dart';
import 'layout/drawer.dart';
import 'pages/startScreen.dart';
import 'pages/homeScreen.dart';
import 'pages/searchScreen.dart';
import 'layout/appBar.dart';
import 'layout/bottomBar.dart';
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
import 'pages/video.dart';
import 'pages/servicesScreen.dart';
import 'pages/privacyScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defultFontFamily = 'Brandon';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
    const primeryTextColor = Colors.black87;
    const secondaryTextColor = Colors.black54;
    const thirdTextColor = Colors.deepOrange;
    const fourTextColor = Colors.white;
    const defaultTextStyle = TextStyle(fontFamily: 'OpenSans');
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
        "/iranian": (context) => IranianScreen(),
        "/japanese": (context) => JapaneseScreen(),
        "/american": (context) => AmericanScreen(),
        "/drawer": (context) => const DrawerWidget(),
        "/become": (context) => const BecomeChefScreen(),



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
      locale: Locale('en'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.deepOrange,
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: defultFontFamily,
            fontWeight: FontWeight.bold,
            color: fourTextColor,
            fontSize: 22,
          ),
          headline4: TextStyle(
            fontFamily: defultFontFamily,
            fontWeight: FontWeight.bold,
            color: thirdTextColor,
            fontSize: 34,
          ),
          headline5: TextStyle(
            fontFamily: defultFontFamily,
            fontWeight: FontWeight.bold,
            color: fourTextColor,
            fontSize: 26,
          ),
          headline3: TextStyle(fontFamily: defultFontFamily),
          subtitle1: TextStyle(
            fontFamily: defultFontFamily,
            fontSize: 19,
            color: primeryTextColor,
          ),
          bodyText1: TextStyle(
            fontFamily: defultFontFamily,
            color: secondaryTextColor,
            fontSize: 19,
          ),
          subtitle2: TextStyle(
            fontFamily: defultFontFamily,
            color: secondaryTextColor,
            fontSize: 17,
          ),
          bodyText2: TextStyle(
            fontFamily: defultFontFamily,
            color: primeryTextColor,
            fontSize: 17,
          ),
          caption: TextStyle(fontFamily: defultFontFamily, fontSize: 15),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// const int HomeIndex = 0;
// const int MenuIndex = 1;
// const int LoginIndex = 2;

// class _MainScreenState extends State<MainScreen> {
//   int SelectedScreenIndex = HomeIndex;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: 1,
//         children: [
//           HomeScreen(),
//           StartScreen(),
//           PersonScreen(),
//           ProfileScreen(),
//           SearchScreen(),
//           SignUpScreen(),
//           LoginScreen(),
//           CartScreen(),
//           PrivacyScreen(),
//           ServicesScreen(),
//           BasketScreen(),
//           CartScreen(),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(32),
//         ),
//       ),
//     );
//   }
// }
