import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sheff_new/data/foodsData.dart';
import 'package:sheff_new/data/repo/auth_repository.dart';
import 'package:sheff_new/data/repo/product_repository.dart';
import 'package:sheff_new/layout/userProfile.dart';
import 'package:sheff_new/pages/auth/auth.dart';
import 'package:sheff_new/pages/auth/auth.dart';
import 'package:sheff_new/pages/booksScreen.dart';
import 'package:sheff_new/pages/cart/cart.dart';
import 'package:sheff_new/pages/cart/cart_item.dart';
import 'package:sheff_new/pages/home/home.dart';
import 'package:sheff_new/pages/ordersScreen.dart';
import 'package:sheff_new/pages/product/details.dart';
import 'package:sheff_new/pages/product/product.dart';
import 'package:sheff_new/pages/productDetails.dart';
import 'package:sheff_new/pages/root.dart';
import 'package:sheff_new/pages/splash.dart';
import 'package:sheff_new/theme.dart';
import 'package:sheff_new/widgets/slider.dart';
import 'layout/drawer.dart';
import 'pages/aboutUs.dart';
import 'pages/americanScreen.dart';
import 'pages/becomeChef.dart';
import 'pages/booksScreen.dart';
import 'pages/cart/cartScreen.dart';
import 'pages/chef.dart';
import 'pages/homeScreen.dart';
import 'pages/iranianScreen.dart';
import 'pages/japaneseScreen.dart';
import 'pages/personScreen.dart';
import 'pages/privacyScreen.dart';
import 'pages/profileScreen.dart';
import 'pages/searchScreen.dart';
import 'pages/servicesScreen.dart';
import 'pages/startScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  authRepository.loadAuthInfo();
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

    // const thirdTextColor = Colors.white;

    return MaterialApp(
      routes: {
        '/start': (context) => const StartScreen(),
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
        "/splash": (context) => const SplashScreen(),
        "/orders": (context) => const OrdersScreen(),
        "/books": (context) => BooksScreen(),
        "/profileDrawer": (context) => const UserProfile(),
        "/product": (context) => ProductDetails(),
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
        appBarTheme: AppBarTheme(
            backgroundColor: themeData.primaryColor,
            foregroundColor: Colors.white),
        primaryColor: Colors.deepOrange,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelStyle: themeData.textTheme.subtitle2,
        ),
        textTheme: const TextTheme(
          headline4: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.bold,
            color: LightThemeColors.primaryColor,
            fontSize: 34,
          ),
          headline5: TextStyle(
            fontFamily: defaultFontFamily,
            color: LightThemeColors.primaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          headline6: TextStyle(
            fontFamily: defaultFontFamily,
            color: LightThemeColors.primaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          subtitle1: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 19,
            color: LightThemeColors.primaryTextColor,
          ),
          bodyText1: TextStyle(
            fontFamily: defaultFontFamily,
            color: LightThemeColors.secondaryTextColor,
            fontSize: 19,
          ),
          subtitle2: TextStyle(
            fontFamily: defaultFontFamily,
            color: LightThemeColors.secondaryTextColor,
            fontSize: 17,
          ),
          bodyText2: TextStyle(
            fontFamily: defaultFontFamily,
            color: LightThemeColors.primaryTextColor,
            fontSize: 17,
          ),
          caption: TextStyle(fontFamily: defaultFontFamily, fontSize: 15),
        ),
        colorScheme: const ColorScheme.light(
          primary: LightThemeColors.primaryColor,
          secondary: LightThemeColors.secondaryColor,
          onSecondary: Colors.white,
        ),
      ),
      home: RootScreen(),
    );
  }
}
