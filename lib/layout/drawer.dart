import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/pages/aboutUs.dart';
import 'package:sheff_new/pages/becomeChef.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => {
                Navigator.pop(context),
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsScreen()));
                  },
                  child: Text(
                    localization.about,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.food_bank_outlined,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BecomeChefScreen()));
                  },
                  child: Text(
                    localization.become,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.card_giftcard_outlined,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    localization.gift,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.subdirectory_arrow_right_outlined,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    localization.signOut,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
