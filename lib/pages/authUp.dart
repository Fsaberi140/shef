import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(

          elevatedButtonTheme: ElevatedButtonThemeData(
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
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: themeData.primaryColor)),
            labelStyle: themeData.textTheme.subtitle2,
            fillColor: const Color(0xFFFBE9E7),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeData.primaryColor,
                width: 2,
              ),
            ),

            contentPadding: const EdgeInsets.all(13),
            border: const OutlineInputBorder(),
          )),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 80, 28, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.signUp,
                        style: themeData.textTheme.headline4,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // _facebook(context, themeData),
                  // const SizedBox(height: 8),
                  // _google(context, themeData),
                  const SizedBox(height: 16),
                  _first(themeData, context),
                  const SizedBox(height: 13),
                  _last(themeData, context),
                  const SizedBox(height: 13),
                  _email(themeData, context),
                  const SizedBox(height: 13),
                  const Password(),
                  const SizedBox(height: 30
                  ),
                  _signUp(context, themeData),
                  // const SizedBox(height: 25),
                  // _description(context, themeData),
                  const SizedBox(height: 25),
                  _have(context, themeData),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  Text(" Sign Up with",style:themeData.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w500),),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _have(BuildContext context, ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.have,
          style: themeData.textTheme.bodyText1!.apply(color: Colors.black87),
        ),
        InkWell(
          child: MouseRegion(
            cursor: SystemMouseCursors.text,
            child: Text(
              AppLocalizations.of(context)!.login,
              style: themeData.textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w500, color: themeData.primaryColor),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "/login");
          },
        )
      ],
    );
  }

  Widget _description(BuildContext context, ThemeData themeData) {
    return RichText(
      text: TextSpan(
        text: AppLocalizations.of(context)!.description,
        style: themeData.textTheme.bodyText2!.copyWith(height: 1.4),
        children: <TextSpan>[
          TextSpan(
            text: AppLocalizations.of(context)!.term,
            style: themeData.textTheme.bodyText2!
                .apply(color: themeData.primaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, "/services");
              },
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.and,
            style: themeData.textTheme.bodyText2,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.policy,
            style: themeData.textTheme.bodyText2!
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

  Widget _signUp(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        ElevatedButton(
          child: Text(
            AppLocalizations.of(context)!.signUp,
            style: themeData.textTheme.headline6,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },

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

  Widget _email(ThemeData themeData, BuildContext context) {
    return TextField(
      cursorColor: themeData.primaryColor,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.email,
      ),
    );
  }
}

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);
  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return TextField(
      cursorColor: themeData.primaryColor,
      keyboardType: TextInputType.phone,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.password,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.black45.withOpacity(0.4),
            ),
          )),
    );
  }
}

Widget _last(ThemeData themeData, BuildContext context) {
  return SizedBox(
    height: 50,
    child: TextField(
      cursorColor: themeData.primaryColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
        border: const OutlineInputBorder(),
        labelStyle: themeData.textTheme.subtitle2,
        labelText: AppLocalizations.of(context)!.last,
      ),
    ),
  );
}

Widget _first(ThemeData themeData, BuildContext context) {
  return SizedBox(
    height: 50,
    child: TextField(
      cursorColor: themeData.primaryColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
        border: const OutlineInputBorder(),
        labelStyle: themeData.textTheme.subtitle2,
        labelText: AppLocalizations.of(context)!.first,
      ),
    ),
  );
}

