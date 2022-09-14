import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/Search.dart';
import '../widgets/SearchExample1.dart';
import '../widgets/SearchExample2.dart';
import '../widgets/SearchExample3.dart';
import '../widgets/SearchExample4.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Search(themeData: themeData),
              const SizedBox(height: 30),
              _text1(context, themeData),
              const SizedBox(height: 10),
              SearchExample1(themeData: themeData),
              const SizedBox(height: 10),
              SearchExample2(themeData: themeData),
              const SizedBox(height: 10),
              _button1(context, themeData),
              const SizedBox(height: 5),
              const Divider(thickness: 2),
              const SizedBox(height: 15),
              _text2(context, themeData),
              const SizedBox(height: 10),
              SearchExample3(themeData: themeData),
              const SizedBox(height: 10),
              SearchExample4(themeData: themeData),
              const SizedBox(height: 10),
              _button1(context, themeData),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _text2(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.chefs,
      style: themeData.textTheme.headline5!.copyWith(color: Colors.black87,fontSize:24, fontWeight: FontWeight.w600),
    );
  }

  Widget _button1(BuildContext context, ThemeData themeData) {
    return ElevatedButton(
      child: Text(
        AppLocalizations.of(context)!.show,
        style: themeData.textTheme.subtitle2!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: themeData.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      ),
    );
  }

  Widget _text1(BuildContext context, ThemeData themeData) {
    return Text(
      AppLocalizations.of(context)!.foods,
      style: themeData.textTheme.headline5!.copyWith(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 24),
    );
  }
}





