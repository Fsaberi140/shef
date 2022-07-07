import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => {
                              Navigator.pushNamed(context, "/home"),
                            },
                        icon: Icon(Icons.arrow_back_ios_new_outlined,
                            color: Colors.grey[600])),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            color: Colors.grey[600],
                            size: 26,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              AppLocalizations.of(context)!.zipcode,
                              style: themeData.textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 2, color: Colors.grey[500]),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.yourFoods,
                  style: themeData.textTheme.headline6!.copyWith(
                    color: Color.fromARGB(200, 0, 0, 0),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.deepOrange,
                  height: 3,
                  width: 80,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/img/foods/5.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.carrot,
                            style: themeData.textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            AppLocalizations.of(context)!.ane,
                            style: themeData.textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.priceOrder,
                          style: themeData.textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: 10,
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
                          //  onpress : quantity == 0 ? null : () => decrement(),
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
                                  style: themeData.textTheme.subtitle1,
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
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/img/foods/4.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.mutter,
                            style: themeData.textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            AppLocalizations.of(context)!.wahid,
                            style: themeData.textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.priceOrder2,
                          style: themeData.textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: 10,
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
                          //  onpress : quantity == 0 ? null : () => decrement(),
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
                                  style: themeData.textTheme.subtitle1,
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
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/img/foods/7.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.injera,
                            style: themeData.textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            AppLocalizations.of(context)!.anuk,
                            style: themeData.textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.priceOrder1,
                          style: themeData.textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: 10,
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
                          //  onpress : quantity == 0 ? null : () => decrement(),
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
                                  style: themeData.textTheme.subtitle1,
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
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey[300],
                      width: 300,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.totalP,
                            style: themeData.textTheme.subtitle1!
                                .copyWith(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            AppLocalizations.of(context)!.total,
                            style: themeData.textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppLocalizations.of(context)!.information,
                  style: themeData.textTheme.headline6!
                      .copyWith(color: Colors.black87),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: themeData.primaryColor,
                  height: 3,
                  width: 120,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  AppLocalizations.of(context)!.phone,
                  style: themeData.textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    cursorColor: themeData.primaryColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: themeData.primaryColor, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      hintStyle: themeData.textTheme.bodyText2!
                          .apply(color: Colors.grey),
                      hintText: AppLocalizations.of(context)!.phone,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  AppLocalizations.of(context)!.address,
                  style: themeData.textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    cursorColor: themeData.primaryColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: themeData.primaryColor, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      hintStyle: themeData.textTheme.bodyText2!
                          .apply(color: Colors.grey),
                      hintText: AppLocalizations.of(context)!.address,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  AppLocalizations.of(context)!.instructions,
                  style: themeData.textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: null,
                    cursorColor: themeData.primaryColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: themeData.primaryColor, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      hintStyle: themeData.textTheme.bodyText1!.apply(
                        color: Colors.grey,
                      ),
                      hintText: AppLocalizations.of(context)!.instructionshint,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.time,
                      style: themeData.textTheme.subtitle1,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.miniuts,
                      style: themeData.textTheme.subtitle1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 3,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.payment,
                  style: themeData.textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
