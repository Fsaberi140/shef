import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAnotherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                    AppBar(),
                    Menu(),
                    _Calendar(),
                    _Favorites()

          ]),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(
      children: [
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
                    style: themeData.textTheme.bodyText2!
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
                    style: themeData.textTheme.bodyText2!
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
                    style: themeData.textTheme.bodyText2!
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
                    style: themeData.textTheme.bodyText2!
                        .copyWith(color: Colors.black87, fontSize: 14),
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
          height: 5,
        ),
      ],
    );
  }
}

class _Calendar extends StatefulWidget {
  _Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<_Calendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date
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

  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(children: [
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
      const SizedBox(height: 3),
      SizedBox(
          height: 85,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
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
                    selectedDate = DateTime.now().add(Duration(days: index));
                  });
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                  height: 55,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        listOfMonths[DateTime.now()
                                    .add(Duration(days: index))
                                    .month -
                                1]
                            .toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: currentDateSelectedIndex == index
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
                            color: currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.grey),
                      ),
                      Text(
                        listOfDays[DateTime.now()
                                    .add(Duration(days: index))
                                    .weekday -
                                1]
                            .toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.grey),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
      const SizedBox(
        height: 10,
      ),
      Divider(
        thickness: 2,
        height: 0,
        color: Colors.grey[300],
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}

class _Favorites extends StatelessWidget {
  const _Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(children: [
      Row(
        children: [
          Text(
            AppLocalizations.of(context)!.favorites,
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
          height: 260,
          width: double.infinity,
          child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/person");
              },
              child: Container(
                width: 300,
                height: 260,
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0))),
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
                            borderRadius: BorderRadius.circular(68)),
                        padding: const EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(72),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(AppLocalizations.of(context)!.ane,
                                  style: themeData.textTheme.bodyText1!
                                      .copyWith(height: 1.5)),
                              const SizedBox(
                                width: 12,
                              ),
                              Row(children: [
                                Text(
                                  AppLocalizations.of(context)!.no1,
                                  style: themeData.textTheme.bodyText2!
                                      .copyWith(color: themeData.primaryColor),
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
                          Text(AppLocalizations.of(context)!.iranianF,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              width: 300,
              height: 260,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.asset(
                    'assets/img/foods/16.jpg',
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
                        borderRadius: BorderRadius.circular(68)),
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(72),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.sashi,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no1,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.japaneseF,
                          style: themeData.textTheme.bodyText1!
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                        borderRadius: BorderRadius.circular(68)),
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
                  bottom: 10,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.wahid,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no3,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.japaneseF,
                          style: themeData.textTheme.bodyText1!
                              .copyWith(height: 1.5)),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    ]);
  }
}

class _Newest extends StatelessWidget {
  const _Newest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(children: [
      Row(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.newest,
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
          height: 260,
          width: double.infinity,
          child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/person");
              },
              child: Container(
                width: 300,
                height: 260,
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0))),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                          borderRadius: BorderRadius.circular(68)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(AppLocalizations.of(context)!.wahid,
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(height: 1.5)),
                            const SizedBox(
                              width: 12,
                            ),
                            Row(children: [
                              Text(
                                AppLocalizations.of(context)!.no3,
                                style: themeData.textTheme.bodyText2!
                                    .copyWith(color: themeData.primaryColor),
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
                        Text(AppLocalizations.of(context)!.japaneseF,
                            style: themeData.textTheme.bodyText1!
                                .copyWith(height: 1.5)),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              width: 300,
              height: 260,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.asset(
                    'assets/img/foods/14.jpg',
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
                        borderRadius: BorderRadius.circular(68)),
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(72),
                      child: Image.asset(
                        'assets/img/persons/3.jpg',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.maryam,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no1,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.iranianF,
                          style: themeData.textTheme.bodyText1!
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                        borderRadius: BorderRadius.circular(68)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.sami,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no2,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.americanF,
                          style: themeData.textTheme.bodyText1!
                              .copyWith(height: 1.5)),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    ]);
  }
}

class _Discount extends StatelessWidget {
  const _Discount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(children: [
      Row(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.discount,
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
          height: 260,
          width: double.infinity,
          child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            Container(
              width: 300,
              height: 260,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.asset(
                    'assets/img/foods/13.jpg',
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
                        borderRadius: BorderRadius.circular(68)),
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(72),
                      child: Image.asset(
                        'assets/img/persons/5.jpg',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.anuk,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no2,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.koreanF,
                          style: themeData.textTheme.bodyText1!
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                        borderRadius: BorderRadius.circular(68)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.sami,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no2,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.americanF,
                          style: themeData.textTheme.bodyText1!
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                        borderRadius: BorderRadius.circular(68)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.wahid,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no3,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.japaneseF,
                          style: themeData.textTheme.bodyText1!
                              .copyWith(height: 1.5)),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    ]);
  }
}

class _Iranian extends StatelessWidget {
  const _Iranian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(children: [
      Row(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.iranianChefs,
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
          height: 260,
          width: double.infinity,
          child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/person");
              },
              child: Container(
                width: 300,
                height: 260,
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0))),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10.0)),
                    child: Image.asset(
                      'assets/img/foods/14.jpg',
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
                          borderRadius: BorderRadius.circular(68)),
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(72),
                        child: Image.asset(
                          'assets/img/persons/3.jpg',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(AppLocalizations.of(context)!.maryam,
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(height: 1.5)),
                            const SizedBox(
                              width: 12,
                            ),
                            Row(children: [
                              Text(
                                AppLocalizations.of(context)!.no1,
                                style: themeData.textTheme.bodyText2!
                                    .copyWith(color: themeData.primaryColor),
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
                        Text(AppLocalizations.of(context)!.iranianF,
                            style: themeData.textTheme.bodyText1!
                                .copyWith(height: 1.5)),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              width: 300,
              height: 260,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                        borderRadius: BorderRadius.circular(68)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.wahid,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no3,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.iranianF,
                          style: themeData.textTheme.bodyText1!
                              .copyWith(height: 1.5)),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    ]);
  }
}

class _Japanese extends StatelessWidget {
  const _Japanese({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(children: [
      Row(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.japaneseChefs,
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
          height: 260,
          width: double.infinity,
          child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/person");
              },
              child: Container(
                width: 300,
                height: 260,
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0))),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10.0)),
                    child: Image.asset(
                      'assets/img/foods/16.jpg',
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
                          borderRadius: BorderRadius.circular(68)),
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(72),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(AppLocalizations.of(context)!.sashi,
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(height: 1.5)),
                            const SizedBox(
                              width: 12,
                            ),
                            Row(children: [
                              Text(
                                AppLocalizations.of(context)!.no1,
                                style: themeData.textTheme.bodyText2!
                                    .copyWith(color: themeData.primaryColor),
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
                        Text(AppLocalizations.of(context)!.japaneseF,
                            style: themeData.textTheme.bodyText1!
                                .copyWith(height: 1.5)),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              width: 300,
              height: 260,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.asset(
                    'assets/img/foods/14.jpg',
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
                        borderRadius: BorderRadius.circular(68)),
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(72),
                      child: Image.asset(
                        'assets/img/persons/3.jpg',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.maryam,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no1,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.japaneseF,
                          style: themeData.textTheme.bodyText1!
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                        borderRadius: BorderRadius.circular(68)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.sami,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no2,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.japaneseF,
                          style: themeData.textTheme.bodyText1!
                              .copyWith(height: 1.5)),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ]);
  }
}

class _American extends StatelessWidget {
  const _American({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(children: [
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
          child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/person");
              },
              child: Container(
                width: 300,
                height: 260,
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0))),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                          borderRadius: BorderRadius.circular(68)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(AppLocalizations.of(context)!.sami,
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(height: 1.5)),
                            const SizedBox(
                              width: 12,
                            ),
                            Row(children: [
                              Text(
                                AppLocalizations.of(context)!.no2,
                                style: themeData.textTheme.bodyText2!
                                    .copyWith(color: themeData.primaryColor),
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
                        Text(AppLocalizations.of(context)!.americanF,
                            style: themeData.textTheme.bodyText1!
                                .copyWith(height: 1.5)),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              width: 300,
              height: 260,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                        borderRadius: BorderRadius.circular(68)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.wahid,
                              style: themeData.textTheme.bodyText1!
                                  .copyWith(height: 1.5)),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(children: [
                            Text(
                              AppLocalizations.of(context)!.no3,
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(color: themeData.primaryColor),
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
                      Text(AppLocalizations.of(context)!.americanF,
                          style: themeData.textTheme.bodyText1!
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10.0)),
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
                          borderRadius: BorderRadius.circular(68)),
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(72),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(AppLocalizations.of(context)!.ane,
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(height: 1.5)),
                            const SizedBox(
                              width: 12,
                            ),
                            Row(children: [
                              Text(
                                AppLocalizations.of(context)!.no1,
                                style: themeData.textTheme.bodyText2!
                                    .copyWith(color: themeData.primaryColor),
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
                        Text(AppLocalizations.of(context)!.americanF,
                            style: themeData.textTheme.bodyText1!
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
      const SizedBox(
        height: 25,
      ),
    ]);
  }
}

class _UpBottom extends StatelessWidget {
  const _UpBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(children: [
      Column(
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
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
