import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
            child: Column(children: [
              _text1(context, themeData),
              const SizedBox(height: 25),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _text2(context, themeData),
                  const SizedBox(height: 15),
                  _text3(context, themeData),
                  const SizedBox(height: 15),
                  _text4(context, themeData),
                  const SizedBox(height: 15),
                  _text5(context, themeData),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _text5(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.text4,
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
      style: themeData.textTheme.subtitle1!
          .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
    );
  }

  Widget _text4(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.text3,
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
      style: themeData.textTheme.subtitle1!
          .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
    );
  }

  Widget _text3(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.text2,
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
      style: themeData.textTheme.subtitle1!
          .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
    );
  }

  Widget _text2(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.text1,
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
      style: themeData.textTheme.subtitle1!
          .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
    );
  }

  Widget _text1(BuildContext context, ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.policy,
          style: themeData.textTheme.headline6!
              .apply(color: themeData.primaryColor),
        ),
      ],
    );
  }
}
