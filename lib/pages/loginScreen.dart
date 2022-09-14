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
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.login,
                      style: themeData.textTheme.headline4,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                _facebook(context, themeData),
                const SizedBox(height: 8),
                _google(context, themeData),
                const SizedBox(height: 16),
                Row(children: [
                  const Expanded(child: Divider(thickness: 2)),
                  const SizedBox(width: 10),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: themeData.textTheme.subtitle1!
                        .apply(color: Colors.black87),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(child: Divider(thickness: 2)),
                ]),
                const SizedBox(height: 16),
                _email(themeData, context),
                const SizedBox(height: 13),
                _password(themeData, context),
                const SizedBox(height: 20),
                _forgot(context, themeData),
                const SizedBox(height: 25),
                _login(context, themeData),
                const SizedBox(height: 25),
                _description(context, themeData),
                const SizedBox(height: 30),
                _not(context, themeData),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgot(BuildContext context, ThemeData themeData) {
    return Row(
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
    );
  }

  Widget _not(BuildContext context, ThemeData themeData) {
    return Row(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.not,
          style: themeData.textTheme.bodyText1!.apply(color: Colors.black87),
        ),
        InkWell(
          child: Text(
            AppLocalizations.of(context)!.create,
            style: themeData.textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.w500,
              color: themeData.primaryColor,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "/signup");
          },
        )
      ],
    );
  }

  Widget _description(BuildContext context, ThemeData themeData) {
    return RichText(
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
    );
  }

  Widget _login(BuildContext context, ThemeData themeData) {
    return Row(
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
            backgroundColor:
                MaterialStateProperty.all<Color>(themeData.primaryColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
          ),
        ),
      ],
    );
  }

  Widget _facebook(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        ElevatedButton(
          child: Text(AppLocalizations.of(context)!.facebook,
              style: themeData.textTheme.headline6),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width - 56, 50),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(themeData.primaryColor),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _google(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        ElevatedButton(
          child: Text(AppLocalizations.of(context)!.google,
              style: themeData.textTheme.headline6),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width - 56, 50),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(themeData.primaryColor),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _password(ThemeData themeData, BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        cursorColor: themeData.primaryColor,
        keyboardType: TextInputType.phone,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: themeData.primaryColor, width: 2)),
            border: const OutlineInputBorder(),
            labelText: AppLocalizations.of(context)!.password,
            labelStyle: themeData.textTheme.bodyText1),
      ),
    );
  }

  Widget _email(ThemeData themeData, BuildContext context) {
    return SizedBox(
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
    );
  }
}
