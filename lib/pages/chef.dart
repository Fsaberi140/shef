import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';

class ChefScreen extends StatefulWidget {
  const ChefScreen({Key? key}) : super(key: key);

  @override
  _ChefScreenState createState() => _ChefScreenState();
}

class _ChefScreenState extends State<ChefScreen> {
  String dropDownValue = 'Iranian';
  var items = [
    'Iranian',
    'Japanese',
    'American',
    'Korean',
    'Italian',
  ];
  String? selectedValue;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 30, 28, 20),
            child: Column(
              children: [
                _text(context, themeData),
                const SizedBox(height: 20),
                Divider(thickness: 2, height: 0, color: Colors.grey[300]),
                _first(themeData, context),
                const SizedBox(height: 13),
                _last(themeData, context),
                const SizedBox(height: 13),
                _email(themeData, context),
                const SizedBox(height: 13),
                _password(themeData, context),
                const SizedBox(height: 13),
                _zipcode(themeData, context),
                const SizedBox(height: 13),
                _phone(themeData, context),
                const SizedBox(height: 13),
                _cuisine(context, themeData),
                const SizedBox(height: 15),
                const SizedBox(width: 10),
                //SizedBox
                _agreement(context, themeData), //Row
                const SizedBox(height: 30),
                _submit(context, themeData),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _submit(BuildContext context, ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text(AppLocalizations.of(context)!.submit,
              style: themeData.textTheme.headline6),
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },
          style: ButtonStyle(
            alignment: Alignment.center,
            minimumSize: MaterialStateProperty.all(
              const Size(200, 45),
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

  Widget _agreement(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              text: AppLocalizations.of(context)!.agree,
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
        ),

        const SizedBox(width: 10), //SizedBox

        Checkbox(
          value: value,
          onChanged: (value) {
            setState(() {
              this.value = value!;
            });
          },
          checkColor: themeData.primaryColor,
          activeColor: Colors.white,
        ),
      ],
    );
  }

  Widget _cuisine(BuildContext context, ThemeData themeData) {
    return SizedBox(
      height: 55,
      child: DecoratedBox(
        decoration: BoxDecoration(
          // color:Colors.lightGreen, //background color of dropdown button
          border: Border.all(
            color: Colors.black45,
          ),
          //border of dropdown button
          borderRadius:
              BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: Text(
                AppLocalizations.of(context)!.pick,
                style: themeData.textTheme.bodyText1,
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: themeData.textTheme.bodyText2,
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              focusColor: themeData.primaryColor,
              isExpanded: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget _phone(ThemeData themeData, BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        cursorColor: themeData.primaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelStyle: themeData.textTheme.bodyText1,
          labelText: AppLocalizations.of(context)!.phone,
        ),
      ),
    );
  }

  Widget _zipcode(ThemeData themeData, BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        cursorColor: themeData.primaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelStyle: themeData.textTheme.bodyText1,
          labelText: AppLocalizations.of(context)!.zip,
        ),
      ),
    );
  }

  Widget _password(ThemeData themeData, BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        cursorColor: themeData.primaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelText: AppLocalizations.of(context)!.password,
          labelStyle: themeData.textTheme.bodyText1,
        ),
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
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelStyle: themeData.textTheme.bodyText1,
          labelText: AppLocalizations.of(context)!.email,
        ),
      ),
    );
  }

  Widget _last(ThemeData themeData, BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        cursorColor: themeData.primaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelStyle: themeData.textTheme.bodyText1,
          labelText: AppLocalizations.of(context)!.last,
        ),
      ),
    );
  }

  Widget _first(ThemeData themeData, BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        cursorColor: themeData.primaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelStyle: themeData.textTheme.bodyText1,
          labelText: AppLocalizations.of(context)!.first,
        ),
      ),
    );
  }

  Widget _text(BuildContext context, ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.become,
          style: themeData.textTheme.headline5!
              .apply(color: themeData.primaryColor),
        ),
      ],
    );
  }
}
