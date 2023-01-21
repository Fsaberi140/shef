import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/pages/root.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
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
                borderSide:
                    BorderSide(width: 2, color: themeData.primaryColor)),
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
              padding: const EdgeInsets.fromLTRB(28, 100, 28, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  const SizedBox(height: 35),
                  _email(themeData, context),
                  const SizedBox(height: 13),
                  const Password(),
                  const SizedBox(height: 15),
                  _forgot(context, themeData),
                  const SizedBox(height: 30),
                  _login(context, themeData),
                  // const SizedBox(height: 25),
                  // _description(context, themeData),
                  const SizedBox(height: 25),
                  _not(context, themeData),
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
                  Text(
                    " Sign In with",
                    style: themeData.textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                  svg()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row svg() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/svg/telegram_svg.png',
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/svg/facebook_svg.png',
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/svg/google_svg.png',
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/svg/linkedin_svg.png',
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/svg/twitter.png',
          width: 20,
          height: 20,
        ),
      ],
    );
  }

  Widget _forgot(BuildContext context, ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.not,
          style: themeData.textTheme.bodyText1!.apply(color: Colors.black87),
        ),
        InkWell(
          child: Text(
            AppLocalizations.of(context)!.create,
            style: themeData.textTheme.bodyText1!.copyWith(
              // fontWeight: FontWeight.w500,
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

  Widget _login(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        ElevatedButton(
          child: Text(
            AppLocalizations.of(context)!.login,
            style: themeData.textTheme.headline6,
          ),
          onPressed: () {

            Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                    builder: (context) =>
                        const RootScreen()));},
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
