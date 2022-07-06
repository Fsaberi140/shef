import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

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
              TextField(
                cursorColor: themeData.primaryColor,
                onTap: () {},
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: themeData.primaryColor, width: 3),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: themeData.primaryColor, width: 3),
                  ),
                  
                  hintText: AppLocalizations.of(context)!.hint,
                  hintStyle:
                      themeData.textTheme.subtitle2!.apply(color: Colors.grey),
                  labelText: AppLocalizations.of(context)!.search,
                  labelStyle: themeData.textTheme.subtitle1!
                      .copyWith(fontWeight: FontWeight.bold)
                      .copyWith(color: themeData.primaryColor),
                  suffixIcon: Icon(
                    Icons.search,
                    color: themeData.primaryColor,
                    size: 26,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                AppLocalizations.of(context)!.foods,
                style:
                    themeData.textTheme.headline5!.apply(color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/img/foods/4.jpg',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.mutter,
                          style: themeData.textTheme.bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          AppLocalizations.of(context)!.ru,
                          style: themeData.textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.no1,
                    style: themeData.textTheme.bodyText1!
                        .copyWith(color: themeData.primaryColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star_outlined,
                    color: themeData.primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/img/foods/5.jpg',
                    width: 80,
                    height: 80,
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
                          style: themeData.textTheme.bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          AppLocalizations.of(context)!.anu,
                          style: themeData.textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.no2,
                    style: themeData.textTheme.bodyText1!
                        .copyWith(color: themeData.primaryColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star_outlined,
                    color: themeData.primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text(
                  AppLocalizations.of(context)!.show,
                  style: themeData.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: themeData.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)!.chefs,
                style:
                    themeData.textTheme.headline5!.apply(color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/img/persons/4.jpg',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.wahid,
                          style: themeData.textTheme.bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          AppLocalizations.of(context)!.iranian,
                          style: themeData.textTheme.bodyText1,
                        ),
                        Text(
                          AppLocalizations.of(context)!.esfahan,
                          style: themeData.textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.no3,
                    style: themeData.textTheme.bodyText1!
                        .copyWith(color: themeData.primaryColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star_outlined,
                    color: themeData.primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/img/persons/5.jpg',
                    width: 80,
                    height: 80,
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
                          style: themeData.textTheme.bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          AppLocalizations.of(context)!.northi,
                          style: themeData.textTheme.bodyText1,
                        ),
                        Text(
                          AppLocalizations.of(context)!.punjabi,
                          style: themeData.textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.no3,
                    style: themeData.textTheme.bodyText1!
                        .copyWith(color: themeData.primaryColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star_outlined,
                    color: themeData.primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text(
                  AppLocalizations.of(context)!.show,
                  style: themeData.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: themeData.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
