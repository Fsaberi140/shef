import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: buildAppBar(themeData, context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                _image1(context),
                _textOnImage(context, themeData),
              ],
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  _text1(context, themeData),
                  const SizedBox(height: 20),
                  _image2(),
                  const SizedBox(height: 50),
                  _headLine1(context, themeData),
                  const SizedBox(height: 10),
                  _text2(context, themeData),
                  const SizedBox(height: 20),
                  _image3(),
                  const SizedBox(height: 40),
                  _text3(context, themeData),
                  const SizedBox(height: 20),
                  _image4(),
                  const SizedBox(height: 70),
                  _shortText(context, themeData),
                  const SizedBox(height: 20),
                  _button(context, themeData),
                  const SizedBox(height: 20),
                  _shortText2(context, themeData),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            _bottomBar(themeData: themeData)
          ]),
        ),
      ),
    );
  }

  Widget _shortText2(BuildContext context, ThemeData themeData) {
    return Text(AppLocalizations.of(context)!.get,
        style: themeData.textTheme.subtitle1);
  }

  Widget _button(BuildContext context, ThemeData themeData) {
    return ElevatedButton(
      child: Text(AppLocalizations.of(context)!.signUp,
          style: themeData.textTheme.headline6),
      onPressed: () {
        Navigator.pushNamed(context, "/signup");
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(200, 50),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(themeData.primaryColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      ),
    );
  }

  Widget _shortText(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.doYou,
      style: themeData.textTheme.headline6!
          .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }

  Widget _image4() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 5)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          'assets/img/foods/23.jpg',
          width: 250,
          height: 250,
        ),
      ),
    );
  }

  Widget _text3(BuildContext context, ThemeData themeData) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(AppLocalizations.of(context)!.aboutChef2,
              textAlign: TextAlign.justify,
              textDirection: TextDirection.ltr,
              style: themeData.textTheme.subtitle1),
        ],
      ),
    );
  }

  Widget _image3() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 5)
        ],
      ),
      child: ClipRRect(
        child: Image.asset(
          'assets/img/foods/22.jpg',
          width: 360,
          height: 230,
        ),
      ),
    );
  }

  Widget _text2(BuildContext context, ThemeData themeData) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(AppLocalizations.of(context)!.aboutChef1,
              textAlign: TextAlign.justify,
              textDirection: TextDirection.ltr,
              style: themeData.textTheme.subtitle1),
        ],
      ),
    );
  }

  Widget _headLine1(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.works,
      style: themeData.textTheme.headline5!.apply(color: Colors.black),
    );
  }

  Widget _image2() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        'assets/img/foods/21.jpg',
        width: 235,
        height: 235,
      ),
    );
  }

  Widget _text1(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.aboutSite,
      style: themeData.textTheme.headline6!
          .copyWith(color: themeData.primaryColor, fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }

  Widget _textOnImage(BuildContext context, ThemeData themeData) {
    return Positioned(
      top: 140,
      left: 8,
      child: Text(
        AppLocalizations.of(context)!.delicious,
        style: themeData.textTheme.headline5!.copyWith(
          color: const Color.fromARGB(255, 30, 30, 40),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Image _image1(BuildContext context) {
    return Image.asset(
      'assets/img/foods/1.jpg',
      width: MediaQuery.of(context).size.width,
    );
  }

  AppBar buildAppBar(ThemeData themeData, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 3,
      shadowColor: themeData.primaryColor,
      title: TextField(
        cursorColor: themeData.primaryColor,
        maxLength: 7,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          hintText: AppLocalizations.of(context)!.enter,
          hintStyle: themeData.textTheme.subtitle2,
          prefixIcon: Icon(
            Icons.place,
            color: themeData.primaryColor,
            size: 26,
          ),
          suffixIcon: IconButton(
              onPressed: () => {
                    Navigator.pushNamed(context, "/home"),
                  },
              icon: Icon(Icons.check_circle,
                  color: themeData.primaryColor, size: 26)),
        ),
      ),
    );
  }
// @override
// void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//   super.debugFillProperties(properties);
//   properties.add(ObjectFlagProperty<Function(int index)>.has('ontap', ontap));
// }
}

class _bottomBar extends StatelessWidget {
  const _bottomBar({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      color: themeData.primaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
              child: Text(
                AppLocalizations.of(context)!.header,
                style: themeData.textTheme.headline3!.copyWith(
                    color: themeData.colorScheme.onPrimary,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Text(
              AppLocalizations.of(context)!.contact,
              style: themeData.textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}
