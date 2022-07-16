import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.customer,
                    style: themeData.textTheme.headline6!
                        .apply(color: themeData.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.text1,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style: themeData.textTheme.subtitle1!.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppLocalizations.of(context)!.text2,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style: themeData.textTheme.subtitle1!.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppLocalizations.of(context)!.text3,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style: themeData.textTheme.subtitle1!.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppLocalizations.of(context)!.text4,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style: themeData.textTheme.subtitle1!.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
