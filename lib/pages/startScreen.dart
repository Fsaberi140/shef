import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartScreen extends StatelessWidget {
  // final Function(int index) onTap;
  const StartScreen({
    Key? key,
    // required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Image.asset(
                  'assets/img/foods/1.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 262,
                ),
                Positioned(
                  top: 140,
                  left: 8,
                  child: Text(
                    AppLocalizations.of(context)!.delicious,
                    style: themeData.textTheme.headline5!.copyWith(
                      color: const Color.fromARGB(255, 30, 30, 40),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.aboutSite,
                    style: themeData.textTheme.headline6!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/img/foods/21.jpg',
                      width: 235,
                      height: 235,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    AppLocalizations.of(context)!.works,
                    style: themeData.textTheme.headline5!
                        .apply(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.aboutChef1,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1!
                              .apply(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 3),
                            blurRadius: 5)
                      ],
                    ),
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/img/foods/22.jpg',
                        width: 360,
                        height: 230,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.aboutChef2,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 3),
                            blurRadius: 5)
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
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    AppLocalizations.of(context)!.doYou,
                    style: themeData.textTheme.headline6!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.signUp,
                        style: themeData.textTheme.headline6),
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(200, 50),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          themeData.primaryColor),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.get,
                    style: themeData.textTheme.subtitle1!
                        .apply(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              color: themeData.primaryColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.header,
                    style: themeData.textTheme.headline3!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic),
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
            )
          ]),
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
