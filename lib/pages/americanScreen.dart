import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/layout/drawer.dart';

class AmericanScreen extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<AmericanScreen> {
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
          child: Text(AppLocalizations.of(context)!.header,
              style: themeData.textTheme.headline4!.copyWith(fontSize: 26)),
        ),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 26,
              )),
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.shopping_cart,
                  color: Colors.black, size: 26)),
          IconButton(
            onPressed: () => {},
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
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 80,
                    //   // child: ListView.builder(
                    //     itemCount: 10,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) {
                    //       return Column(
                    //         children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
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
                                style: themeData.textTheme.subtitle2!.copyWith(
                                    fontSize: 14, color: Colors.black87),
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
                                  'assets/img/types/2.jpg',
                                  width: 75,
                                  height: 60,
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text(
                                AppLocalizations.of(context)!.iranian,
                                style: themeData.textTheme.subtitle2!.copyWith(
                                    fontSize: 14, color: Colors.black87),
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
                                style: themeData.textTheme.bodyText2!.copyWith(
                                    fontSize: 14, color: Colors.black87),
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
                                style: themeData.textTheme.bodyText2!.copyWith(
                                    fontSize: 14, color: Colors.black87),
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
                                  'assets/img/types/5.jpg',
                                  width: 75,
                                  height: 60,
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text(
                                AppLocalizations.of(context)!.american,
                                style: themeData.textTheme.bodyText2!.copyWith(
                                    fontSize: 14, color: Colors.black87),
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
                                style: themeData.textTheme.bodyText2!.copyWith(
                                    color: Colors.black87, fontSize: 14),
                              )
                            ]),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      height: 0,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                            height: 25,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              selectedDate.day.toString() +
                                  '-' +
                                  listOfMonths[selectedDate.month - 1] +
                                  ', ' +
                                  selectedDate.year.toString(),
                              style: themeData.textTheme.subtitle2,
                            )),
                        const SizedBox(height: 5),
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
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(3, 3),
                                              blurRadius: 5)
                                        ],
                                        color: currentDateSelectedIndex == index
                                            ? Colors.deepOrange
                                            : Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          listOfMonths[DateTime.now()
                                                      .add(
                                                          Duration(days: index))
                                                      .month -
                                                  1]
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: currentDateSelectedIndex ==
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
                                              color: currentDateSelectedIndex ==
                                                      index
                                                  ? Colors.white
                                                  : Colors.grey),
                                        ),
                                        Text(
                                          listOfDays[DateTime.now()
                                                      .add(
                                                          Duration(days: index))
                                                      .weekday -
                                                  1]
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: currentDateSelectedIndex ==
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
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 2,
                      height: 0,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //           ],
                    //         );
                    //       }),
                    // ),

                    Row(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppLocalizations.of(context)!.americanChefs,
                          style: themeData.textTheme.headline5!
                              .copyWith(color: themeData.primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 275,
                      alignment: AlignmentDirectional.center,
                      child: SizedBox(
                        height: 275,
                        width: double.infinity,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                width: 300,
                                height: 260,
                                margin: const EdgeInsets.all(1),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10.0))),
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(10.0)),
                                    child: Image.asset(
                                      'assets/img/foods/15.jpg',
                                      width: 300,
                                      height: 150,
                                    ),
                                  ),
                                  Positioned(
                                    top: 120,
                                    left: 115,
                                    child: Container(
                                      margin: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(68)),
                                      padding: const EdgeInsets.all(4),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(72),
                                        child: Image.asset(
                                          'assets/img/persons/6.jpg',
                                          width: 70,
                                          height: 70,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 15,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                AppLocalizations.of(context)!
                                                    .sami,
                                                style: themeData
                                                    .textTheme.bodyText1!
                                                    .copyWith(height: 1.5)),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Row(children: [
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .no2,
                                                style: themeData
                                                    .textTheme.bodyText2!
                                                    .copyWith(
                                                        color: themeData
                                                            .primaryColor),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Icon(
                                                Icons.star_outlined,
                                                size: 20,
                                                color: themeData.primaryColor,
                                              ),
                                            ]),
                                          ],
                                        ),
                                        Text(
                                            AppLocalizations.of(context)!
                                                .americanF,
                                            style: themeData
                                                .textTheme.bodyText1!
                                                .copyWith(height: 1.5)),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                width: 300,
                                height: 260,
                                margin: const EdgeInsets.all(1),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10.0))),
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(10.0)),
                                    child: Image.asset(
                                      'assets/img/foods/12.jpg',
                                      width: 300,
                                      height: 150,
                                    ),
                                  ),
                                  Positioned(
                                    top: 120,
                                    left: 115,
                                    child: Container(
                                      margin: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(68)),
                                      padding: const EdgeInsets.all(4),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(72),
                                        child: Image.asset(
                                          'assets/img/persons/2.jpg',
                                          width: 70,
                                          height: 70,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 15,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                AppLocalizations.of(context)!
                                                    .wahid,
                                                style: themeData
                                                    .textTheme.bodyText1!
                                                    .copyWith(height: 1.5)),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Row(children: [
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .no3,
                                                style: themeData
                                                    .textTheme.bodyText2!
                                                    .copyWith(
                                                        color: themeData
                                                            .primaryColor),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Icon(
                                                Icons.star_outlined,
                                                size: 20,
                                                color: themeData.primaryColor,
                                              ),
                                            ]),
                                          ],
                                        ),
                                        Text(
                                            AppLocalizations.of(context)!
                                                .americanF,
                                            style: themeData
                                                .textTheme.bodyText1!
                                                .copyWith(height: 1.5)),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                width: 300,
                                height: 275,
                                margin: const EdgeInsets.all(1),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10.0))),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(10.0)),
                                      child: Image.asset(
                                        'assets/img/foods/11.jpg',
                                        width: 300,
                                        height: 150,
                                      ),
                                    ),
                                    Positioned(
                                      top: 120,
                                      left: 115,
                                      child: Container(
                                        margin: const EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(68)),
                                        padding: const EdgeInsets.all(4),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(72),
                                          child: Image.asset(
                                            'assets/img/persons/4.jpg',
                                            width: 70,
                                            height: 70,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      left: 15,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)!
                                                      .ane,
                                                  style: themeData
                                                      .textTheme.bodyText1!
                                                      .copyWith(height: 1.5)),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Row(children: [
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .no1,
                                                  style: themeData
                                                      .textTheme.bodyText2!
                                                      .copyWith(
                                                          color: themeData
                                                              .primaryColor),
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Icon(
                                                  Icons.star_outlined,
                                                  size: 20,
                                                  color: themeData.primaryColor,
                                                ),
                                              ]),
                                            ],
                                          ),
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .americanF,
                                              style: themeData
                                                  .textTheme.bodyText1!
                                                  .copyWith(height: 1.5)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.ondemand_video,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        AppLocalizations.of(context)!.videos,
                        style: themeData.textTheme.subtitle1,
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
                    style: themeData.textTheme.subtitle1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
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
                  height: 300,
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
                    InkWell(
                      onTap: () {},
                      child: Text(
                        AppLocalizations.of(context)!.header,
                        style: themeData.textTheme.headline5!.copyWith(
                          color: themeData.colorScheme.onPrimary,
                        ),
                      ),
                    ),
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
                          style: themeData.textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: themeData.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
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
                          AppLocalizations.of(context)!.list,
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
                          style: themeData.textTheme.subtitle1!.copyWith(
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
                          height: 10,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, "/become");

                          },
                          child:  Text(
                          AppLocalizations.of(context)!.become,
                          style: themeData.textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                        ),),
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
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: themeData.textTheme.subtitle1!.copyWith(
                                color: themeData.colorScheme.onPrimary,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.bold),
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
