import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/widgets/BottomPart2.dart';
import 'package:sheff_new/widgets/BottomPart3.dart';
import 'package:sheff_new/widgets/BottomPart1.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, required this.themeData}) : super(key: key);
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(
      children: [
        const Divider(thickness: 3, height: 0, color: Colors.black),
        Part1(themeData: themeData),
        const Divider(thickness: 3, height: 0, color: Colors.black),
        Part2(themeData: themeData),
        Text(
          AppLocalizations.of(context)!.contact,
          textAlign: TextAlign.center,
          style: themeData.textTheme.subtitle1!.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Part3(themeData: themeData),
      ],
    );
  }
}
