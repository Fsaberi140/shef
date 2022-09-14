import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SearchExample4 extends StatelessWidget {
  const SearchExample4({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/img/persons/5.jpg',
          width: 70,
          height: 70,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.anuk,
                style: themeData.textTheme.subtitle2!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalizations.of(context)!.northi,
                style: themeData.textTheme.subtitle2,
              ),
              Text(
                AppLocalizations.of(context)!.punjabi,
                style: themeData.textTheme.subtitle2,
              ),
            ],
          ),
        ),
        Text(
          AppLocalizations.of(context)!.no3,
          style: themeData.textTheme.subtitle2!
              .copyWith(color: themeData.primaryColor),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          Icons.star_outlined,
          color: themeData.primaryColor,
          size: 18,
        ),
      ],
    );
  }
}
