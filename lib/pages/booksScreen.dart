import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/layout/drawer.dart';
import 'package:sheff_new/pages/productDetails.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      key: _key,
      appBar: _appBar(themeData, context),
      // bottomNavigationBar: const RootScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(localization.list,
                  textAlign: TextAlign.left,
                  style: themeData.textTheme.headline6
                     ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 157,
                decoration: BoxDecoration(
                    color: Colors.deepOrange[50],
                    boxShadow: const [
                      BoxShadow(blurRadius: 2),
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetails()));
                              },
                              child: Image.asset(
                                'assets/img/foods/11.jpg',
                                width: 90,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(localization.asian),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Text("Sami Lurgy"),
                                const SizedBox(height: 5),
                                InkWell(
                                  onTap: () {},
                                  child: Row(children: [
                                    Text(
                                      localization.no1,
                                      style: themeData.textTheme.caption!
                                          .copyWith(color: Colors.black87),
                                    ),
                                    const SizedBox(width: 2),
                                    Icon(
                                      Icons.star_border_outlined,
                                      size: 18,
                                      color: themeData.primaryColor,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "1543",
                                      style: themeData.textTheme.caption!
                                          .copyWith(color: Colors.black87),
                                    )
                                  ]),
                                ),
                              ])
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text(localization.detail,
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(color: themeData.colorScheme.onSecondary)),
                            onPressed: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                Size(
                                  MediaQuery.of(context).size.width / 2 - 60,
                                  30,
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  themeData.primaryColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2))),
                            ),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton(
                            child: Text(localization.remove,
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(color: themeData.colorScheme.onSecondary)),
                            onPressed: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                Size(
                                  MediaQuery.of(context).size.width / 2 - 60,
                                  30,
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  themeData.primaryColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2))),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 157,
                decoration: BoxDecoration(
                    color: Colors.deepOrange[50],
                    boxShadow: const [
                      BoxShadow(blurRadius: 2),
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetails()));},
                              child: Image.asset(
                                'assets/img/foods/12.jpg',
                                width: 90,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(localization.asian),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Text("Maryam Saber"),
                                const SizedBox(height: 5),
                                InkWell(
                                  onTap: () {},
                                  child: Row(children: [
                                    Text(
                                      localization.no3,
                                      style: themeData.textTheme.caption!
                                          .copyWith(color: Colors.black87),
                                    ),
                                    const SizedBox(width: 2),
                                    Icon(
                                      Icons.star_border_outlined,
                                      size: 18,
                                      color: themeData.primaryColor,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "24150",
                                      style: themeData.textTheme.caption!
                                          .copyWith(color: Colors.black87),
                                    )
                                  ]),
                                ),
                              ])
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text(localization.detail,
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(color: themeData.colorScheme.onSecondary)),
                            onPressed: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                Size(
                                  MediaQuery.of(context).size.width / 2 - 60,
                                  30,
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  themeData.primaryColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2))),
                            ),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton(
                            child: Text(localization.remove,
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(color: themeData.colorScheme.onSecondary)),
                            onPressed: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                Size(
                                  MediaQuery.of(context).size.width / 2 - 60,
                                  30,
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  themeData.primaryColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2))),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
         localization.doWant,
                style: themeData.textTheme.subtitle1,
              ),
              const SizedBox(height: 10),
              Text(
                localization.introduce,
                style: themeData.textTheme.bodyText2!.copyWith(
                    color: themeData.primaryColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
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
