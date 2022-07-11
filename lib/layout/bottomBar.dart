import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomScreen extends StatelessWidget {
  const BottomScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Column(
              children: [
                const Divider(
                  thickness: 3,
                  height: 0,
                  color: Colors.black,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
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
                    Text(
                      AppLocalizations.of(context)!.facebookB,
                      style: themeData.textTheme.subtitle1!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.instagram,
                      style: themeData.textTheme.subtitle1!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.twitter,
                      style: themeData.textTheme.subtitle1!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
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
                      height: 35,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        AppLocalizations.of(context)!.header,
                        style: themeData.textTheme.headline5!.copyWith(
                          color: themeData.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ]),
                ),
                const Divider(
                  thickness: 3,
                  height: 0,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          AppLocalizations.of(context)!.customer,
                          style: themeData.textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: themeData.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, "/become");

                          },
                          child: Text(
                          AppLocalizations.of(context)!.become,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.blog,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.careers,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.gift,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          AppLocalizations.of(context)!.corporate,
                          style: themeData.textTheme.subtitle2!.copyWith(
                            color: themeData.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppLocalizations.of(context)!.about,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.become,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.food,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.help,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)!.contact,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                          style: themeData.textTheme.subtitle1!.copyWith(
                              color: themeData.colorScheme.onPrimary,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: themeData.textTheme.subtitle1!.copyWith(
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
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.policy,
                            style: themeData.textTheme.subtitle2!.copyWith(
                              color: themeData.colorScheme.onPrimary,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
