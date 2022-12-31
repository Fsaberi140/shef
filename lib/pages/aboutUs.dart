import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/layout/drawer.dart';
import 'package:sheff_new/pages/bottomBar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _key,
      appBar: _AppBar(themeData, context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            _image(context),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
              child: _Body(themeData: themeData),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: BottomBar(themeData: themeData),
            ),
          ]),
        ),
      ),
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
    );
  }

  AppBar _AppBar(ThemeData themeData, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      shadowColor: themeData.primaryColor,
      leading: _leading(),
      title: _title(context, themeData),
      actions: [
        appBarIcon1(context),
        appBarIcon2(context),
        appBarIcon3(context),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget appBarIcon3(BuildContext context) {
    return IconButton(
          onPressed: () => {
            Navigator.pushNamed(context, "/profile"),
          },
          icon: const Icon(
            Icons.person_sharp,
            color: Colors.black,
            size: 26,
          ),
        );
  }

  Widget appBarIcon2(BuildContext context) {
    return IconButton(
            onPressed: () => {
                  Navigator.pushNamed(context, "/cart"),
                },
            icon: const Icon(Icons.shopping_cart,
                color: Colors.black, size: 26));
  }

  Widget appBarIcon1(BuildContext context) {
    return IconButton(
            onPressed: () => {
                  Navigator.pushNamed(context, "/search"),
                },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 26,
            ));
  }

  Widget _title(BuildContext context, ThemeData themeData) {
    return Padding(
        padding: const EdgeInsets.only(left: 0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/home");
          },
          child: Text(AppLocalizations.of(context)!.header,
              style: themeData.textTheme.headline4!.copyWith(fontSize: 26)),
        ),
      );
  }

  Widget _leading() {
    return IconButton(
        onPressed: () => {_key.currentState!.openDrawer()},
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 26,
        ),
      );
  }

  Widget _image(BuildContext context) {
    return Image.asset(
      'assets/img/foods/51.jpg',
      width: MediaQuery.of(context).size.width,

    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.themeData,
  }) : super(key: key);
  final ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _text1(context),
      const SizedBox(height: 20),
      _text2(context),
      const SizedBox(height: 15),
      _text3(context),
      const SizedBox(height: 20),
      _image(),
      const SizedBox(height: 40),
      _text4(context),
      const SizedBox(height: 20),
      _text5(context),
    ]);
  }

  Widget _text5(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Text(AppLocalizations.of(context)!.alvin,
          textAlign: TextAlign.justify,
          textDirection: TextDirection.ltr,
          style: themeData.textTheme.subtitle1),
    ]);
  }

  Widget _text4(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.our,
            style: themeData.textTheme.headline6!.copyWith(
                color: themeData.primaryColor, fontWeight: FontWeight.w500),
          ),
        ]);
  }

  Widget _image() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 5)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          'assets/img/foods/53.jpg',fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _text3(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Text(AppLocalizations.of(context)!.three,
          textAlign: TextAlign.justify,
          textDirection: TextDirection.ltr,
          style: themeData.textTheme.subtitle1),
    ]);
  }

  Widget _text2(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Text(AppLocalizations.of(context)!.helping,
          textAlign: TextAlign.justify,
          textDirection: TextDirection.ltr,
          style: themeData.textTheme.subtitle1),
    ]);
  }

  Widget _text1(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Text(
        AppLocalizations.of(context)!.home,
        style: themeData.textTheme.headline5!.copyWith(
            color: themeData.primaryColor, fontWeight: FontWeight.w400),
      ),
    ]);
  }
}
