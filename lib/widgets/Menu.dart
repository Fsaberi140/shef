import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      alignment: AlignmentDirectional.center,
      child: SizedBox(
        height: 95,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            const SizedBox(
              width: 11,
            ),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: Image.asset(
                  'assets/img/types/1.jpg',
                  width: 75,
                  height: 60,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                AppLocalizations.of(context)!.all,
                style: themeData.textTheme.subtitle2!
                    .copyWith(fontSize: 14, color: Colors.black87),
              )
            ]),
            const SizedBox(
              width: 11,
            ),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/iranian");
                },
                child: Image.asset(
                  'assets/img/types/5.jpg',
                  width: 75,
                  height: 60,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                AppLocalizations.of(context)!.iranian,
                style: themeData.textTheme.subtitle2!
                    .copyWith(fontSize: 14, color: Colors.black87),
              )
            ]),
            const SizedBox(
              width: 11,
            ),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/japanese");
                },
                child: Image.asset(
                  'assets/img/types/3.jpg',
                  width: 75,
                  height: 60,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                AppLocalizations.of(context)!.japanese,
                style: themeData.textTheme.subtitle2!
                    .copyWith(fontSize: 14, color: Colors.black87),
              )
            ]),


            const SizedBox(
              width: 11,
            ),
            Column(children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/img/types/4.jpg',
                  width: 75,
                  height: 60,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                AppLocalizations.of(context)!.korean,
                style: themeData.textTheme.subtitle2!
                    .copyWith(fontSize: 14, color: Colors.black87),
              )
            ]),
            const SizedBox(
              width: 11,
            ),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/american");
                },
                child: Image.asset(
                  'assets/img/types/2.jpg',
                  width: 75,
                  height: 60,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                AppLocalizations.of(context)!.american,
                style: themeData.textTheme.subtitle2!
                    .copyWith(fontSize: 14, color: Colors.black87),
              )
            ]),
            const SizedBox(
              width: 11,
            ),
            Column(children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/img/types/6.jpg',
                  width: 75,
                  height: 60,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                AppLocalizations.of(context)!.italian,
                style: themeData.textTheme.subtitle2!
                    .copyWith(color: Colors.black87, fontSize: 14),
              )
            ]),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
