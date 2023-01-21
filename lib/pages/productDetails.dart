import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bottomBar.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _key,
      appBar: _appBar(themeData, context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.asian,
                style: themeData.textTheme.subtitle1!.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/img/foodData/foodData_2.jpg',
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.ingredients,
                      style: const TextStyle(
                          fontSize: 19,
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(0, -8))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.deepOrange,
                          decorationThickness: 3),
                      // textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/svg/egg_svg.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.egg,
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/svg/sugar_svg.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.sugar,
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/svg/biscuit_svg.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.biscuit,
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/svg/coffee_svg.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.coffee,
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 100),

                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/svg/butter_svg.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.butter,
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/svg/milk_svg.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.milk,
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/svg/salt_svg.png',
                                  width: 25,
                                  height: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.salt,
                                  style: themeData.textTheme.subtitle1!
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
const Divider(thickness: 2,),
                    const SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.recipes,
                      style: const TextStyle(
                          fontSize: 19,
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(0, -8))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.deepOrange,
                          decorationThickness: 3),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                            AppLocalizations.of(context)!.varies,
                            textAlign: TextAlign.justify,
                            style: themeData.textTheme.subtitle1
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: _upBottom(context, themeData),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: BottomBar(themeData: themeData),
              ),
            ],
          ),
        ),
      )),
    );
  }
  Widget _upBottom(BuildContext context, ThemeData themeData) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.header,
            style: themeData.textTheme.headline4!
                .copyWith(color: themeData.primaryColor, fontSize: 31),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.ondemand_video,
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                AppLocalizations.of(context)!.videos,
                style: themeData.textTheme.bodyText2,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.buy,
            style: themeData.textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
  AppBar _appBar(ThemeData themeData, BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: themeData.primaryColor,
        leading: IconButton(
          onPressed: () => {_key.currentState!.openDrawer()},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 26,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
            child: Text(AppLocalizations.of(context)!.header,
                style: themeData.textTheme.headline4!.copyWith(fontSize: 26)),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.pushNamed(context, "/search"),
                  },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 26,
              )),
          IconButton(
              onPressed: () => {
                    Navigator.pushNamed(context, "/cart"),
                  },
              icon: const Icon(Icons.shopping_cart,
                  color: Colors.black, size: 26)),
          IconButton(
            onPressed: () => {
              Navigator.pushNamed(context, "/profile"),
            },
            icon: const Icon(
              Icons.person_sharp,
              color: Colors.black,
              size: 26,
            ),
          ),
          const SizedBox(width: 10),
        ]);
  }
}
