import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/layout/drawer.dart';
import '../data/chefsData.dart';
import '../widgets/PersonItem1.dart';
import '../widgets/PersonItem2.dart';
import 'bottomBar.dart';
import 'package:flutter/gestures.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen
    ({Key? key,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}
class _CalendarState extends State<PersonScreen> {
  DateTime selectedDate = DateTime.now();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController = ScrollController();

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // _profileImage(),
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
                        _star(context, themeData),
                        _slogan(themeData, context),
                        const SizedBox(height: 10),
                        _profileDescription(context, themeData),
                        const SizedBox(height: 25),
                        Divider(
                            thickness: 2, height: 0, color: Colors.grey[300]),
                        const SizedBox(height: 15),
                        _calendar(),
                        const SizedBox(height: 15),
                        Divider(
                            thickness: 2, height: 0, color: Colors.grey[300]),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Text(AppLocalizations.of(context)!.items,
                                style: themeData.textTheme.headline4!.copyWith(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    PersonItem1(themeData: themeData),
                    const SizedBox(height: 18),
                    PersonItem2(themeData: themeData),
                  ]),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {},
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: Text(
                  AppLocalizations.of(context)!.header,
                  style: themeData.textTheme.headline4,
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Text(
                AppLocalizations.of(context)!.buy,
                style: themeData.textTheme.subtitle1,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: BottomBar(themeData: themeData),
            ),
          ]),
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
            icon:
                const Icon(Icons.shopping_cart, color: Colors.black, size: 26)),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _profileDescription(BuildContext context, ThemeData themeData) {
    return RichText(
      text: TextSpan(
        text: AppLocalizations.of(context)!.i,
        style: themeData.textTheme.subtitle2!
            .copyWith(fontWeight: FontWeight.w400),
        children: <TextSpan>[
          TextSpan(
            text: AppLocalizations.of(context)!.more,
            style: themeData.textTheme.subtitle2!
                .copyWith(fontStyle: FontStyle.italic, color: Colors.black87),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, "/services");
              },
          ),
        ],
      ),
    );
  }

  Widget _slogan(ThemeData themeData, BuildContext context) {
    return Row(
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
    );
  }

  Widget _star(BuildContext context, ThemeData themeData) {
    return Row(
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
                style:
                    themeData.textTheme.subtitle2!.apply(color: Colors.black),
              ),
              const SizedBox(width: 5),
              Icon(Icons.star, color: themeData.primaryColor, size: 14),
              Icon(Icons.star, color: themeData.primaryColor, size: 14),
              Icon(Icons.star, color: themeData.primaryColor, size: 14),
              Icon(Icons.star, color: themeData.primaryColor, size: 14),
              Icon(Icons.star, color: themeData.primaryColor, size: 14),
            ],
          ),
        )
      ],
    );
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
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
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
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget _profileImage(ChefData chefData) {
    final ThemeData themeData = Theme.of(context);


    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(74),
          color: themeData.primaryColor),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(72)),
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(76),
          // child: Image.asset(
          //   'assets/img/chefData/${widget.chefData.imageChef.indexOf('0')}',
          //   width: 147,
          //   height: 147,
          // ),
        ),
      ),
    );
  }
}
