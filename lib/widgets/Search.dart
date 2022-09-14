import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Search extends StatelessWidget {
  const Search({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: themeData.primaryColor,
      onTap: () {},
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: themeData.primaryColor, width: 3),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: themeData.primaryColor, width: 3),
        ),
        hintText: AppLocalizations.of(context)!.hint,
        hintStyle: themeData.textTheme.subtitle2!.apply(color: Colors.grey),

        suffixIcon: Icon(
          Icons.search,
          color: themeData.primaryColor,
          size: 26,
        ),
      ),
    );
  }
}
