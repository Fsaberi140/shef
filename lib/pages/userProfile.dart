import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/data/authInfo.dart';
import 'package:sheff_new/data/repo/cart_repository.dart';
import 'package:sheff_new/pages/auth/auth.dart';
import 'package:sheff_new/pages/profileScreen.dart';

import '../data/repo/auth_repository.dart';
import 'booksScreen.dart';
import 'order/order_history.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ValueListenableBuilder<AuthInfo?>(
              valueListenable: AuthRepository.authChangeNotifier,
              builder: (context, authInfo, child) {
                final isLogin = authInfo != null &&
                    authInfo.accessToken.isNotEmpty;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset('assets/img/persons/person_1.jpg',
                          width: 70, height: 70),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      isLogin ? authInfo.email : localization.guest,
                      style: themeData.textTheme.headline6!
                          .copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    Divider(thickness: 3, color: themeData.primaryColor),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: themeData.primaryColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            localization.profile,
                            style: themeData.textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(builder: (context) =>
                                BooksScreen()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.bookmark_added_outlined,
                            color: themeData.primaryColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            localization.books,
                            style:
                            themeData.textTheme.subtitle1!.copyWith(
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => const OrderHistoryScreen()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: themeData.primaryColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            localization.orders,
                            style:
                            themeData.textTheme.subtitle1!.copyWith(
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(builder: (
                                context) => const ProfileScreen()));
                        // AddressScreen
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            color: themeData.primaryColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            localization.delivery,
                            style:
                            themeData.textTheme.subtitle1!.copyWith(
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context, rootNavigator: true).push(
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ProfileScreen()));
                        // GiftScreen
                      },
                      child: Row(
                        children: [
                          Icon(Icons.card_giftcard_outlined,
                              color: themeData.primaryColor, size: 30),
                          const SizedBox(width: 10),
                          Text(localization.gift,
                              style: themeData.textTheme.subtitle1!
                                  .copyWith(fontSize: 18)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context, rootNavigator: true).push(
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const ProfileScreen()));
                        // MassageScreen
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.message_outlined,
                            color: themeData.primaryColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            localization.message,
                            style:
                            themeData.textTheme.subtitle1!.copyWith(
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        if (isLogin) {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              content: Text(localization.sure),
                              actions: [
                                TextButton(onPressed: () {
                                  Navigator.pop(context);
                                  CartRepository.cartItemCountNotifier.value =
                                  0;
                                  authRepository.signOut();
                                }, child: Text(localization.yes)),
                                TextButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text(localization.no))
                              ],
                            );
                          });
                        } else {
                          Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(
                                builder: (context) => const AuthScreen()));
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            isLogin
                                ? Icons.subdirectory_arrow_left_outlined
                                : Icons.subdirectory_arrow_right_outlined,
                            color: themeData.primaryColor,
                            size: 30,
                          ),
                          Text(
                            isLogin ? localization.signOut : localization.login,
                            style:
                            themeData.textTheme.subtitle1!.copyWith(
                                fontSize: 18),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}
