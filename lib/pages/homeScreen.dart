import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/layout/drawer.dart';
import 'package:sheff_new/pages/bottomNavigation.dart';
import '../widgets/Menu.dart';
import '../widgets/FavoritesList.dart';
import 'bottomBar.dart';
import '../widgets/AmericanChefsList.dart';
import '../widgets/JapaneseChefsList.dart';
import '../widgets/IranianChefsList.dart';
import '../widgets/DiscountList.dart';
import '../widgets/NewestList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();


}

class _CalendarState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      key: _key,
      appBar: _appBar(themeData, context),
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 8, 0, 0),
                child: Menu(),
              ),
              Divider(
                thickness: 2,
                height: 0,
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0, 5),
                child: Column(children: [
                  _calendarText(themeData),
                  const SizedBox(height: 5),
                  _calendar(),
                  const SizedBox(height: 10),
                ]),
              ),
              Divider(
                thickness: 2,
                height: 0,
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Column(children: [
                  _favorites(context, themeData),
                  const SizedBox(height: 8),
                  FavoritesList(themeData: themeData),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Column(children: [
                  _newest(context, themeData),
                  const SizedBox(height: 8),
                  NewestList(themeData: themeData),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Column(children: [
                  _discount(context, themeData),
                  const SizedBox(height: 8),
                  DiscountList(themeData: themeData),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Column(children: [
                  _iranianChefs(context, themeData),
                  const SizedBox(height: 8),
                  IranianChefsList(themeData: themeData),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Column(children: [
                  _japaneseChefs(context, themeData),
                  const SizedBox(height: 8),
                  JapaneseChefsList(themeData: themeData),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Column(children: [
                  _americanChefs(context, themeData),
                  const SizedBox(height: 8),
                  AmericanChefsList(themeData: themeData),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: _upBottom(context, themeData),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: BottomBar(themeData: themeData),
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

  Widget _americanChefs(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.americanChefs,
          style: themeData.textTheme.headline5!
              .copyWith(color: themeData.primaryColor),
        ),
      ],
    );
  }

  Widget _japaneseChefs(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.japaneseChefs,
          style: themeData.textTheme.headline5!
              .copyWith(color: themeData.primaryColor),
        ),
      ],
    );
  }

  Widget _iranianChefs(BuildContext context, ThemeData themeData) {
    return Row(
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
    );
  }

  Widget _discount(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.discount,
          style: themeData.textTheme.headline5!
              .copyWith(color: themeData.primaryColor),
        ),
      ],
    );
  }

  Widget _newest(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.newest,
          style: themeData.textTheme.headline5!
              .copyWith(color: themeData.primaryColor),
        ),
      ],
    );
  }

  Widget _favorites(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.favorites,
          style: themeData.textTheme.headline5!
              .copyWith(color: themeData.primaryColor),
        ),
      ],
    );
  }

  Widget _calendarText(ThemeData themeData) {
    return Container(
        height: 25,
        alignment: Alignment.centerLeft,
        child: Text(
          selectedDate.day.toString() +
              '-' +
              listOfMonths[selectedDate.month - 1] +
              ', ' +
              selectedDate.year.toString(),
          style: themeData.textTheme.subtitle2,
        ));
  }

  Widget _calendar() {
    return SizedBox(
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
                      listOfMonths[
                              DateTime.now().add(Duration(days: index)).month -
                                  1]
                          .toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: currentDateSelectedIndex == index
                              ? Colors.white
                              : Colors.grey),
                    ),
                    Text(
                      DateTime.now().add(Duration(days: index)).day.toString(),
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
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
