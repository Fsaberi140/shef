
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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