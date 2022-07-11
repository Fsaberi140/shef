import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:video_player/video_player.dart';

class BecomeChefScreen extends StatelessWidget {
  const BecomeChefScreen({Key? key}) : super(key: key);

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
                  top: 130,
                  left: 8,
                  child: Text(
                    AppLocalizations.of(context)!.earn,
                    style: themeData.textTheme.headline6!.copyWith(
                      color: themeData.colorScheme.onPrimary,
                      fontSize: 23,

                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.why,
                      style: themeData.textTheme.headline6!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.make,
                      style: themeData.textTheme.headline6!.copyWith(
                        color: Colors.black87,

                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.it,
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
                      style: themeData.textTheme.headline6!.copyWith(
                        color: Colors.black87,

                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.design,
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
                      style: themeData.textTheme.headline6!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.bold,
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
                      style: themeData.textTheme.headline5!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.step1,
                      style: themeData.textTheme.headline5!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      AppLocalizations.of(context)!.approved,
                      style: themeData.textTheme.headline6!.copyWith(
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
                      style: themeData.textTheme.headline5!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.pick,
                      style: themeData.textTheme.headline6!.copyWith(
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
                      style: themeData.textTheme.headline5!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.prepare,
                      style: themeData.textTheme.headline6!.copyWith(
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
                      style: themeData.textTheme.headline5!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.cool,
                      style: themeData.textTheme.headline6!.copyWith(
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
                      style: themeData.textTheme.headline5!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      AppLocalizations.of(context)!.serve,
                      style: themeData.textTheme.headline6!.copyWith(
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
                          style: themeData.textTheme.headline6,
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, "/home");
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(170, 45),
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
                      height: 50,
                    ),

                    Text(
                      AppLocalizations.of(context)!.frequently,
                      style: themeData.textTheme.headline6!.copyWith(
                        color: themeData.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                            onTap: (){
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
