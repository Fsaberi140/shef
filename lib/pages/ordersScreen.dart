import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/layout/drawer.dart';


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
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
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.orders,
                      textAlign: TextAlign.left,
                      style: themeData.textTheme.headline6!
                          .copyWith(color: Colors.black87)),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange[50],
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(3)),
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
                                child: Image.asset(
                                  'assets/img/foods/11.jpg',
                                  width: 90,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: const [
                                      Text("14 November"),
                                      SizedBox(width: 20),
                                      Text("12:27"),
                                    ]),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        Text(AppLocalizations.of(context)!
                                            .asian),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    const Text("Sami Lurgy"),
                                  ])
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                child: Text(
                                    AppLocalizations.of(context)!.invoice,
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    Size(
                                      MediaQuery.of(context).size.width / 2 -
                                          60,
                                      30,
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          themeData.primaryColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                ),
                              ),
                              const SizedBox(width: 15),
                              ElevatedButton(
                                child: Text(
                                    AppLocalizations.of(context)!.reOrder,
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    Size(
                                      MediaQuery.of(context).size.width / 2 -
                                          60,
                                      30,
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          themeData.primaryColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 157,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange[50],
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(3)),
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
                                child: Image.asset(
                                  'assets/img/foods/12.jpg',
                                  width: 90,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: const [
                                      Text("23 December"),
                                      SizedBox(width: 20),
                                      Text("10:58"),
                                    ]),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        Text(AppLocalizations.of(context)!
                                            .asian),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    const Text("Maryam Saber"),
                                  ])
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                child: Text(
                                    AppLocalizations.of(context)!.invoice,
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    Size(
                                      MediaQuery.of(context).size.width / 2 -
                                          60,
                                      30,
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          themeData.primaryColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                ),
                              ),
                              const SizedBox(width: 15),
                              ElevatedButton(
                                child: Text(
                                    AppLocalizations.of(context)!.reOrder,
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    Size(
                                      MediaQuery.of(context).size.width / 2 -
                                          60,
                                      30,
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          themeData.primaryColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2))),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
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
