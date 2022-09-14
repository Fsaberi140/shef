import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Part1 extends StatelessWidget {
  const Part1({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 235,
      decoration: BoxDecoration(
        color: themeData.primaryColor,
      ),
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.follow,
          style: themeData.textTheme.subtitle1!.copyWith(
              color: themeData.colorScheme.onPrimary,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),

        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: (){},
          child: Text(
            AppLocalizations.of(context)!.facebookB,
            style: themeData.textTheme.subtitle1!.copyWith(
              color: themeData.colorScheme.onPrimary,
            ),
          ),),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: (){},
          child: Text(
            AppLocalizations.of(context)!.instagram,
            style: themeData.textTheme.subtitle1!.copyWith(
              color: themeData.colorScheme.onPrimary,
            ),
          ),),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: (){},
          child:Text(
            AppLocalizations.of(context)!.twitter,
            style: themeData.textTheme.subtitle1!.copyWith(
              color: themeData.colorScheme.onPrimary,
            ),
          ),),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.promotion,
          style: themeData.textTheme.subtitle1!.copyWith(
            color: themeData.colorScheme.onPrimary,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 15,
        ),

      ]),
    );
  }
}
