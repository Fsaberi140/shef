import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
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
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                'assets/img/persons/person_1.jpg',
                width: 70,
                height: 70,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.zyazdani,
              style:
                  themeData.textTheme.headline6!.copyWith(fontWeight:FontWeight.w600, color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
              color: themeData.primaryColor,
            ),
            const SizedBox(
              height: 25,
            ),
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
                    Navigator.pushNamed(context, "/become");
                  },
                  child: Text(
                    AppLocalizations.of(context)!.become,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.place_outlined,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppLocalizations.of(context)!.browsing,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
                    AppLocalizations.of(context)!.gift,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/profile");
                  },
                  child: Text(
                    AppLocalizations.of(context)!.profile,
                    style: themeData.textTheme.subtitle1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  child: Text(
                    AppLocalizations.of(context)!.orders,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.message_outlined,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppLocalizations.of(context)!.message,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.bookmark_outline,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppLocalizations.of(context)!.following,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.place_outlined,
                  color: themeData.primaryColor,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppLocalizations.of(context)!.delivery,
                    style:
                        themeData.textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text(
                    AppLocalizations.of(context)!.login,
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
