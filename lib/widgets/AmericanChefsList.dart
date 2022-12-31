import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AmericanChefsList extends StatelessWidget {
  const AmericanChefsList({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: _item1(context),
          ),
          const SizedBox(
            width: 12,
          ),
          _item2(context),
          const SizedBox(
            width: 12,
          ),
          _item3(context),
        ]),
      ),
    );
  }

  Widget _item3(BuildContext context) {
    return Container(
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
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(10.0))),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.asset(
                  'assets/img/foodData/foodData_1.jpg',
                  fit: BoxFit.cover,

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
                      'assets/img/persons/person_4.jpg',
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
        );
  }

  Widget _item2(BuildContext context) {
    return Container(
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
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(10.0))),
          child: Stack(children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.asset(
                'assets/img/foodData/foodData_2.jpg',
                fit: BoxFit.cover,

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
                    'assets/img/persons/person_2.jpg',
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
        );
  }

  Widget _item1(BuildContext context) {
    return Container(
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
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(10.0))),
            child: Stack(children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.asset(
                  'assets/img/foodData/foodData_5.jpg',
                  fit: BoxFit.cover,

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
                      'assets/img/persons/person_6.jpg',
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
          );
  }
}
