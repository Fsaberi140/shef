import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/layout/drawer.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<PersonScreen> {
  DateTime selectedDate = DateTime.now(); // TO tracking date
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
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
          child: Text(AppLocalizations.of(context)!.header,
              style: themeData.textTheme.headline4!.copyWith(fontSize: 26)),
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
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(74),
                            color: themeData.primaryColor),
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(72)),
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(76),
                            child: Image.asset(
                              'assets/img/persons/4.jpg',
                              width: 147,
                              height: 147,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.sukhdeep,
                              style: themeData.textTheme.headline6!.copyWith(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 5),
                          Text(
                            AppLocalizations.of(context)!.north,
                            style: themeData.textTheme.subtitle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.no1,
                                      style: themeData.textTheme.subtitle2!
                                          .apply(color: Colors.black),
                                    ),
                                    const SizedBox(width: 5),
                                    Icon(Icons.star,
                                        color: themeData.primaryColor,
                                        size: 14),
                                    Icon(Icons.star,
                                        color: themeData.primaryColor,
                                        size: 14),
                                    Icon(Icons.star,
                                        color: themeData.primaryColor,
                                        size: 14),
                                    Icon(Icons.star,
                                        color: themeData.primaryColor,
                                        size: 14),
                                    Icon(Icons.star,
                                        color: themeData.primaryColor,
                                        size: 14),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => {},
                                child: Icon(
                                  Icons.privacy_tip,
                                  color: themeData.primaryColor,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                AppLocalizations.of(context)!.safety,
                                style: themeData.textTheme.subtitle1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.i,
                                style: themeData.textTheme.subtitle2,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(AppLocalizations.of(context)!.more,
                                    style: themeData.textTheme.subtitle2!
                                        .copyWith(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black87)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 2,
                            height: 0,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              height: 85,
                              child: ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(width: 10);
                                },
                                itemCount: 365,
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        currentDateSelectedIndex = index;
                                        selectedDate = DateTime.now()
                                            .add(Duration(days: index));
                                      });
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      height: 50,
                                      width: 70,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(3, 3),
                                                blurRadius: 5)
                                          ],
                                          color:
                                              currentDateSelectedIndex == index
                                                  ? Colors.deepOrange
                                                  : Colors.white),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            listOfMonths[DateTime.now()
                                                        .add(Duration(
                                                            days: index))
                                                        .month -
                                                    1]
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    currentDateSelectedIndex ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.grey),
                                          ),
                                          Text(
                                            DateTime.now()
                                                .add(Duration(days: index))
                                                .day
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    currentDateSelectedIndex ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.grey),
                                          ),
                                          Text(
                                            listOfDays[DateTime.now()
                                                        .add(Duration(
                                                            days: index))
                                                        .weekday -
                                                    1]
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    currentDateSelectedIndex ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Divider(
                            thickness: 2,
                            height: 0,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.items,
                                style: themeData.textTheme.headline4!.copyWith(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10.0)),
                                child: Image.asset(
                                  'assets/img/foods/32.jpg',
                                  width: 360,
                                  height: 240,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 20, 12, 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .asian,
                                              style: themeData
                                                  .textTheme.subtitle1),
                                        ),
                                        Text(
                                            AppLocalizations.of(context)!.price,
                                            style: themeData
                                                .textTheme.subtitle2!
                                                .apply(color: Colors.black)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.include,
                                      style: themeData.textTheme.subtitle2,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        AppLocalizations.of(context)!.details,
                                        style: themeData.textTheme.bodyText2!
                                            .copyWith(
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ElevatedButton(
                                      child: Text(
                                        AppLocalizations.of(context)!.add,
                                        style: themeData.textTheme.bodyText1!
                                            .apply(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      320, 160, 0, 0),
                                              child: SizedBox(
                                                height: 80,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                      shape:
                                                          const CircleBorder(),
                                                      primary:
                                                          Color(0xffA3DD45),
                                                      minimumSize:
                                                          const Size(60, 60)),
                                                  child: const Icon(
                                                      Icons.add_circle_outline),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      style: ButtonStyle(
                                        alignment: Alignment.center,
                                        minimumSize: MaterialStateProperty.all(
                                          const Size(160, 35),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                themeData.primaryColor),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        AppLocalizations.of(context)!.addList,
                                        style: themeData.textTheme.caption!
                                            .apply(
                                                color: Color.fromARGB(
                                                    255, 40, 68, 124)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10.0)),
                                child: Image.asset(
                                  'assets/img/foods/31.jpg',
                                  width: 360,
                                  height: 240,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 20, 12, 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .asian,
                                              style: themeData
                                                  .textTheme.subtitle1),
                                        ),
                                        Text(
                                            AppLocalizations.of(context)!.price,
                                            style: themeData
                                                .textTheme.subtitle2!
                                                .apply(color: Colors.black)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.include,
                                      style: themeData.textTheme.subtitle2,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        AppLocalizations.of(context)!.details,
                                        style: themeData.textTheme.bodyText2!
                                            .copyWith(
                                                fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ElevatedButton(
                                      child: Text(
                                        AppLocalizations.of(context)!.add,
                                        style: themeData.textTheme.bodyText1!
                                            .apply(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      320, 160, 0, 0),
                                              child: SizedBox(
                                                height: 80,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                      shape:
                                                          const CircleBorder(),
                                                      primary:
                                                          Color(0xffA3DD45),
                                                      minimumSize:
                                                          const Size(60, 60)),
                                                  child: const Icon(
                                                      Icons.add_circle_outline),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      style: ButtonStyle(
                                        alignment: Alignment.center,
                                        minimumSize: MaterialStateProperty.all(
                                          const Size(160, 35),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                themeData.primaryColor),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        AppLocalizations.of(context)!.addList,
                                        style: themeData.textTheme.caption!
                                            .apply(
                                                color: const Color.fromARGB(
                                                    255, 40, 68, 124)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ])),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                AppLocalizations.of(context)!.header,
                style: themeData.textTheme.headline4,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                AppLocalizations.of(context)!.buy,
                style: themeData.textTheme.subtitle1,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                const Divider(
                  thickness: 3,
                  height: 0,
                  color: Colors.black,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    color: themeData.primaryColor,
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.follow,
                      style: themeData.textTheme.subtitle1!.copyWith(
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.facebookB,
                      style: themeData.textTheme.subtitle1!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.instagram,
                      style: themeData.textTheme.subtitle1!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.twitter,
                      style: themeData.textTheme.subtitle1!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.promotion,
                      style: themeData.textTheme.subtitle1!.copyWith(
                        color: themeData.colorScheme.onPrimary,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Text(
                    //     AppLocalizations.of(context)!.header,
                    //     style: themeData.textTheme.headline5!.copyWith(
                    //         color: themeData.colorScheme.onPrimary,
                    //         fontStyle: FontStyle.italic),
                    //   ),
                    // ),
                  ]),
                ),
                const Divider(
                  thickness: 3,
                  height: 0,
                  color: Colors.black,
                ),
                Row(
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
                          style: themeData.textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: themeData.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppLocalizations.of(context)!.become,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.blog,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.careers,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.gift,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
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
                          style: themeData.textTheme.subtitle2!.copyWith(
                            color: themeData.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppLocalizations.of(context)!.about,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.become,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.food,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.help,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)!.contact,
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: const BoxDecoration(color: Color(0xff0D253C)),
                  child: Column(children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.already,
                          style: themeData.textTheme.subtitle1!.copyWith(
                              color: themeData.colorScheme.onPrimary,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: themeData.textTheme.subtitle1!.copyWith(
                                color: themeData.colorScheme.onPrimary,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.policy,
                            style: themeData.textTheme.subtitle2!.copyWith(
                              color: themeData.colorScheme.onPrimary,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.term,
                            style: themeData.textTheme.subtitle2!.copyWith(
                              color: themeData.colorScheme.onPrimary,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ]),
        ),
      ),
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
    );
  }
}
