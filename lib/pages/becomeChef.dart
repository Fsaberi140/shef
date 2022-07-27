import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:video_player/video_player.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
class BecomeChefScreen extends StatelessWidget {
  const BecomeChefScreen({Key? key}) : super(key: key);

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  final _loremIpsum =
  '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<BecomeChefScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Create and store the VideoPlayerController. The VideoPlayerController
//     // offers several different constructors to play videos from assets, files,
//     // or the internet.
//     _controller = VideoPlayerController.network(
//       'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//     );
//
//     _initializeVideoPlayerFuture = _controller.initialize();
//   }

  // @override
  // void dispose() {
  //   // Ensure disposing of the VideoPlayerController to free up resources.
  //   _controller.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
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
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                Image.asset(
                  'assets/img/foods/41.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 205,
                ),
                Positioned(
                  top: 132,
                  left: 8,
                  child: Text(
                    AppLocalizations.of(context)!.earn,
                    style: themeData.textTheme.headline6!.copyWith(
                      color: themeData.colorScheme.onPrimary,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.why,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,

                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.make,
                      style: themeData.textTheme.bodyText1!.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.it,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1!
                              .apply(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.be,
                      style: themeData.textTheme.bodyText1!.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.design,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1!
                              .apply(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      AppLocalizations.of(context)!.success,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,

                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 360,
                    //   // margin: const EdgeInsets.all(1),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       boxShadow: const [
                    //         BoxShadow(
                    //           blurRadius: 2,
                    //         ),
                    //       ],
                    //       borderRadius: BorderRadius.circular(10)),
                    //
                    //   child:

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
                      height: 60,
                    ),
                    Text(
                      AppLocalizations.of(context)!.how,
                      style: themeData.textTheme.headline6!.copyWith(
                        color: themeData.primaryColor,

                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                      style: themeData.textTheme.bodyText1!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.submit,
                          style: themeData.textTheme.subtitle1!
                              .apply(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.step2,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.pick,
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.ltr,
                      style: themeData.textTheme.bodyText1!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.choose,
                          style: themeData.textTheme.subtitle1!
                              .apply(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.step3,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,

                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.prepare,
                      style: themeData.textTheme.bodyText1!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.can,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1!
                              .apply(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.step4,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,

                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.cool,
                      style: themeData.textTheme.bodyText1!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.once,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: themeData.textTheme.subtitle1!
                              .apply(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.step5,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,

                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.serve,
                      style: themeData.textTheme.bodyText1!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text(
                          AppLocalizations.of(context)!.started,
                          style: themeData.textTheme.headline6!.copyWith(fontWeight: FontWeight.w500)
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, "/home");
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(220, 45),
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
                      height: 60,
                    ),

                    Text(
                      AppLocalizations.of(context)!.frequently,
                      style: themeData.textTheme.headline6!.apply(
                        color: themeData.primaryColor,

                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.does,
                      style:
                          themeData.textTheme.subtitle1!.copyWith(fontSize: 21),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.paid,
                      style:
                          themeData.textTheme.subtitle1!.copyWith(fontSize: 21),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.what,
                      style:
                          themeData.textTheme.subtitle1!.copyWith(fontSize: 21),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
          Accordion(
        maxOpenSections: 2,
        headerBackgroundColorOpened: Colors.black54,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding:
        const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            isOpen: true,
            leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
            headerBackgroundColor: Colors.black,
            headerBackgroundColorOpened: Colors.red,
            header: Text('Introduction', style: _headerStyle),
            content: Text(_loremIpsum, style: _contentStyle),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: true,
            leftIcon: const Icon(Icons.compare_rounded, color: Colors.white),
            header: Text('Nested Accordion', style: _headerStyle),
            contentBorderColor: const Color(0xffffffff),
            headerBackgroundColorOpened: Colors.amber,
            content: Accordion(
              maxOpenSections: 1,
              headerBackgroundColorOpened: Colors.black54,
              headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              children: [
                AccordionSection(
                  isOpen: true,
                  leftIcon:
                  const Icon(Icons.insights_rounded, color: Colors.white),
                  headerBackgroundColor: Colors.black38,
                  headerBackgroundColorOpened: Colors.black54,
                  header: Text('Nested Section #1', style: _headerStyle),
                  content: Text(_loremIpsum, style: _contentStyle),
                  contentHorizontalPadding: 20,
                  contentBorderColor: Colors.black54,
                ),
                AccordionSection(
                  isOpen: true,
                  leftIcon:
                  const Icon(Icons.compare_rounded, color: Colors.white),
                  header: Text('Nested Section #2', style: _headerStyle),
                  headerBackgroundColor: Colors.black38,
                  headerBackgroundColorOpened: Colors.black54,
                  contentBorderColor: Colors.black54,
                  content: Row(
                    children: [
                      const Icon(Icons.compare_rounded,
                          size: 120, color: Colors.orangeAccent),
                      Flexible(
                          flex: 1,
                          child: Text(_loremIpsum, style: _contentStyle)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.food_bank, color: Colors.white),
            header: Text('Company Info', style: _headerStyle),
            content: DataTable(
              sortAscending: true,
              sortColumnIndex: 1,
              dataRowHeight: 40,
              showBottomBorder: false,
              columns: [
                DataColumn(
                    label: Text('ID', style: _contentStyleHeader),
                    numeric: true),
                DataColumn(
                    label: Text('Description', style: _contentStyleHeader)),
                DataColumn(
                    label: Text('Price', style: _contentStyleHeader),
                    numeric: true),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('1',
                        style: _contentStyle, textAlign: TextAlign.right)),
                    DataCell(Text('Fancy Product', style: _contentStyle)),
                    DataCell(Text(r'$ 199.99',
                        style: _contentStyle, textAlign: TextAlign.right))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('2',
                        style: _contentStyle, textAlign: TextAlign.right)),
                    DataCell(Text('Another Product', style: _contentStyle)),
                    DataCell(Text(r'$ 79.00',
                        style: _contentStyle, textAlign: TextAlign.right))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('3',
                        style: _contentStyle, textAlign: TextAlign.right)),
                    DataCell(Text('Really Cool Stuff', style: _contentStyle)),
                    DataCell(Text(r'$ 9.99',
                        style: _contentStyle, textAlign: TextAlign.right))
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('4',
                        style: _contentStyle, textAlign: TextAlign.right)),
                    DataCell(
                        Text('Last Product goes here', style: _contentStyle)),
                    DataCell(Text(r'$ 19.99',
                        style: _contentStyle, textAlign: TextAlign.right))
                  ],
                ),
              ],
            ),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.contact_page, color: Colors.white),
            header: Text('Contact', style: _headerStyle),
            content: Wrap(
              children: List.generate(
                  30,
                      (index) => const Icon(Icons.contact_page,
                      size: 30, color: Color(0xff999999))),
            ),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.computer, color: Colors.white),
            header: Text('Jobs', style: _headerStyle),
            content: const Icon(Icons.computer,
                size: 200, color: Color(0xff999999)),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.movie, color: Colors.white),
            header: Text('Culture', style: _headerStyle),
            content:
            const Icon(Icons.movie, size: 200, color: Color(0xff999999)),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.people, color: Colors.white),
            header: Text('Community', style: _headerStyle),
            content:
            const Icon(Icons.people, size: 200, color: Color(0xff999999)),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.map, color: Colors.white),
            header: Text('Map', style: _headerStyle),
            content:
            const Icon(Icons.map, size: 200, color: Color(0xff999999)),
          ),
        ],
      ),


                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Column(
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
                            style: themeData.textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: themeData.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/become");
                            },
                            child: Text(
                              AppLocalizations.of(context)!.become,
                              style: themeData.textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                              ),
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
            ),
          ]),
        ),
      ),
    );
  }
}
