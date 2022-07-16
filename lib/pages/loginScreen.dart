import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.login,
                      style: themeData.textTheme.headline4,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: Text(AppLocalizations.of(context)!.facebook,
                          style: themeData.textTheme.headline6),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width - 56, 50),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            themeData.primaryColor),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: Text(AppLocalizations.of(context)!.google,
                          style: themeData.textTheme.headline6),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width - 56, 50),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            themeData.primaryColor),
                      ),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(children: [
                   Expanded(
                      child: Divider(
                    thickness: 2,
                  )),
                  const SizedBox(width: 10),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: themeData.textTheme.subtitle1!
                        .apply(color: Colors.black87),
                  ),
                  const SizedBox(width: 10),
                   Expanded(
                      child: Divider(
                    thickness: 2,
                  )),
                ]),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 55,
                  child: TextField(
                    cursorColor: themeData.primaryColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: themeData.primaryColor,
                          width: 2,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: themeData.textTheme.bodyText1,
                      labelText: AppLocalizations.of(context)!.email,
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                SizedBox(
                  height: 55,
                  child: TextField(
                    cursorColor: themeData.primaryColor,
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: themeData.primaryColor, width: 2)),
                        border: const OutlineInputBorder(),
                        labelText: AppLocalizations.of(context)!.password,
                        labelStyle: themeData.textTheme.bodyText1),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        AppLocalizations.of(context)!.forgot,
                        style: themeData.textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: themeData.textTheme.headline6,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width - 56, 50),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            themeData.primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.description,
                    style: themeData.textTheme.subtitle1!.copyWith(height: 1.7),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppLocalizations.of(context)!.term,
                        style: themeData.textTheme.subtitle1!
                            .apply(color: themeData.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/services");
                          },
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.and,
                        style: themeData.textTheme.subtitle1,
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.policy,
                        style: themeData.textTheme.subtitle1!
                            .apply(color: themeData.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/privacy");
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.not,
                      style: themeData.textTheme.bodyText1!
                          .apply(color: Colors.black87),
                    ),
                    InkWell(
                      child: Text(
                        AppLocalizations.of(context)!.creat,
                        style: themeData.textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: themeData.primaryColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
