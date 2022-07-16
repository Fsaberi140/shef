import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 340,
                      height: 150,
                      margin: const EdgeInsets.all(1),
                      // decoration: const BoxDecoration(
                      //   color: Colors.white,
                      // ),

                      child: Stack(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/img/foods/5.jpg',
                              width: 90,
                              height: 90,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 75,
                          left: 0,
                          child: Container(
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(68)),
                            padding: const EdgeInsets.all(3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(72),
                              child: Image.asset(
                                'assets/img/persons/4.jpg',
                                width: 55,
                                height: 55,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(135, 20, 0, 0),
                          child: Row(children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.carrot,
                                    style: themeData.textTheme.bodyText1,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.ane,
                                    style: themeData.textTheme.bodyText1,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.remove_circle_outline_outlined,
                                        color: themeData.primaryColor,
                                        semanticLabel: 'Subtract',
                                      ),
                                      onTap: () {},
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 0.5)),
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 20.0,
                                        child: Center(
                                          child: Text(
                                            '1',
                                            style:
                                                themeData.textTheme.subtitle1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.add_circle_outline_outlined,
                                        color: themeData.primaryColor,
                                        semanticLabel: 'ADD',
                                      ),
                                      onTap: () {},
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.priceOrder,
                                    style: themeData.textTheme.subtitle1,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ]),
                        ),
                      ]),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
