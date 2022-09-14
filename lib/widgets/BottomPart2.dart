import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Part2 extends StatelessWidget {
  const Part2({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              style: themeData.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.bold,
                color: themeData.primaryColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: (){
                // Navigator.pushNamed(context, "/become");

              },
              child: Text(
                AppLocalizations.of(context)!.blog,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){},
              child:Text(
                AppLocalizations.of(context)!.careers,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){},
              child:Text(
                AppLocalizations.of(context)!.list,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){},
              child:Text(
                AppLocalizations.of(context)!.gift,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),),
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
              style: themeData.textTheme.subtitle1!.copyWith(
                color: themeData.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: (){Navigator.pushNamed(context, "/about");},
              child:Text(
                AppLocalizations.of(context)!.about,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){},
              child:Text(
                AppLocalizations.of(context)!.food,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),),
            const SizedBox(
              height: 10
            ),
            InkWell(
              onTap: (){},
              child:Text(
                AppLocalizations.of(context)!.help,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),),
            const SizedBox(
              height: 10
            ),
            InkWell(
              onTap: (){Navigator.pushNamed(context, "/become");},
              child:Text(
                AppLocalizations.of(context)!.become,
                style: themeData.textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
              ),),
            const SizedBox(
              height: 20
            ),
          ],
        ),
      ],
    );
  }
}