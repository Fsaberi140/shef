import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Part3 extends StatelessWidget {
  const Part3({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(color: Color(0xff0D253C)),
      child: Column(children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.already,
              style: themeData.textTheme.subtitle2!.copyWith(
                  color: themeData.colorScheme.onPrimary,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {Navigator.pushNamed(context, "/login");},
              child: Text(
                AppLocalizations.of(context)!.login,
                style: themeData.textTheme.subtitle2!.copyWith(
                    color: themeData.colorScheme.onPrimary,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {Navigator.pushNamed(context, "/privacy");},
              child: Text(
                AppLocalizations.of(context)!.privacy,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: themeData.colorScheme.onPrimary,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {Navigator.pushNamed(context, "/services");},
              child: Text(
                AppLocalizations.of(context)!.term,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: themeData.colorScheme.onPrimary,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ]),
    );
  }
}
