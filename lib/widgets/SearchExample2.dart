import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SearchExample2 extends StatelessWidget {
  const SearchExample2({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/img/foods/5.jpg',
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
                AppLocalizations.of(context)!.injera,
                style: themeData.textTheme.subtitle2!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalizations.of(context)!.anu,
                style: themeData.textTheme.subtitle2,
              ),
            ],
          ),
        ),
        Text(
          AppLocalizations.of(context)!.no2,
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
