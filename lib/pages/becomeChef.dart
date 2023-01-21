import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:video_player/video_player.dart';
import 'package:accordion/accordion.dart';
import '../layout/drawer.dart';
import 'bottomBar.dart';

class BecomeChefScreen extends StatefulWidget {
  const BecomeChefScreen({Key? key}) : super(key: key);

  @override
  State<BecomeChefScreen> createState() => _BecomeChefScreenState();
}

class _BecomeChefScreenState extends State<BecomeChefScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _key,
      appBar: _AppBar(themeData, context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Image$text(themeData: themeData),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.why,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.make,
                      style: themeData.textTheme.subtitle1!.copyWith(
                           fontWeight: FontWeight.w600,),
                    ),
                    const SizedBox(height: 5),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.it,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      AppLocalizations.of(context)!.be,
                      style: themeData.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.design,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      AppLocalizations.of(context)!.success,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset(
                          'assets/img/foods/42.jpg',
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                      ),
                    ),
                    // ),
                    const SizedBox(
                      height:40
                    ),
                    Text(
                      AppLocalizations.of(context)!.how,
                      style: themeData.textTheme.headline6!.copyWith(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10
                    ),
                    Text(
                      AppLocalizations.of(context)!.step1,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      AppLocalizations.of(context)!.approved,
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.ltr,
                      style: themeData.textTheme.subtitle1!.copyWith(

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.sample,
                          style: themeData.textTheme.subtitle1
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10
                    ),
                    Text(
                      AppLocalizations.of(context)!.step2,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5
                    ),
                    Text(
                      AppLocalizations.of(context)!.pick,
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.ltr,
                      style: themeData.textTheme.subtitle1!.copyWith(

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.choose,
                          style: themeData.textTheme.subtitle1
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10
                    ),
                    Text(
                      AppLocalizations.of(context)!.step3,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5
                    ),
                    Text(
                      AppLocalizations.of(context)!.prepare,
                      style: themeData.textTheme.subtitle1!.copyWith(

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.can,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10
                    ),
                    Text(
                      AppLocalizations.of(context)!.step4,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5
                    ),
                    Text(
                      AppLocalizations.of(context)!.cool,
                      style: themeData.textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.once,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10
                    ),
                    Text(
                      AppLocalizations.of(context)!.step5,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5
                    ),
                    Text(
                      AppLocalizations.of(context)!.serve,
                      style: themeData.textTheme.subtitle1!.copyWith(

                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.we,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1!
                              .apply(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text(AppLocalizations.of(context)!.started,
                            style: themeData.textTheme.headline6),
                        onPressed: () {
                          Navigator.pushNamed(context, "/chef");
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(200, 45),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              themeData.primaryColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45
                    ),

                    Text(
                      AppLocalizations.of(context)!.frequently,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),

                    Accordion(
                      maxOpenSections: 2,
                      headerBackgroundColorOpened: Colors.black12,
                      headerBackgroundColor: Colors.black12,
                      contentBorderColor: Colors.black12,
                      headerBorderRadius: 2,
                      rightIcon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black54, size: 22),
                      children: [
                        AccordionSection(
                          isOpen: false,
                          header: Text(
                            AppLocalizations.of(context)!.does,
                            style: themeData.textTheme.subtitle1

                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () => {},
                                  child: Text(
                                      AppLocalizations.of(context)!.varies,
                                      textAlign: TextAlign.justify,
                                      style: themeData.textTheme.bodyText1)),
                            ],
                          ),
                        ),
                        AccordionSection(
                          isOpen: false,
                          header: Text(
                            AppLocalizations.of(context)!.paid,
                            style: themeData.textTheme.subtitle1
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => {},
                                child: Text(
                                  AppLocalizations.of(context)!.partner,
                                  style: themeData.textTheme.bodyText1,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AccordionSection(
                          isOpen: false,
                          header: Text(
                            AppLocalizations.of(context)!.what,
                            style: themeData.textTheme.subtitle1
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => {},
                                child: Text(
                                    AppLocalizations.of(context)!.community,
                                    textAlign: TextAlign.justify,
                                    style: themeData.textTheme.bodyText1),
                              ),
                            ],
                          ),
                        ),
                        AccordionSection(
                          isOpen: false,
                          header: Text(
                            AppLocalizations.of(context)!.cooking,
                            style: themeData.textTheme.subtitle1
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => {},
                                child: Text(AppLocalizations.of(context)!.easy,
                                    textAlign: TextAlign.justify,
                                    style: themeData.textTheme.bodyText1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
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

  AppBar _AppBar(ThemeData themeData, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      shadowColor: themeData.primaryColor,
      leading: leading(),
      title: title(context, themeData),
      actions: [
        appBarIcon1(context),
        appBarIcon2(context),
        const SizedBox(width: 10),
      ],
    );
  }

  IconButton appBarIcon2(BuildContext context) {
    return IconButton(
        onPressed: () => {
              Navigator.pushNamed(context, "/cart"),
            },
        icon: const Icon(Icons.shopping_cart, color: Colors.black, size: 26));
  }

  IconButton appBarIcon1(BuildContext context) {
    return IconButton(
        onPressed: () => {
              Navigator.pushNamed(context, "/search"),
            },
        icon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 26,
        ));
  }

  Padding title(BuildContext context, ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Text(AppLocalizations.of(context)!.header,
          style: themeData.textTheme.headline4!.copyWith(fontSize: 26)),
    );
  }

  IconButton leading() {
    return IconButton(
      onPressed: () => {_key.currentState!.openDrawer()},
      icon: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 26,
      ),
    );
  }
}

class _Image$text extends StatelessWidget {
  const _Image$text({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/img/foods/41.jpg',
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            AppLocalizations.of(context)!.earn,
            style: themeData.textTheme.headline6!.copyWith(
                color: themeData.colorScheme.onPrimary,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
