import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AppBarWidget extends StatelessWidget {
 // const AppBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: themeData.primaryColor,
        leading: IconButton(
          onPressed: () => {

          },
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
              onPressed: () => {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 26,
              )),
          IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.shopping_cart,
                  color: Colors.black, size: 26)),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.person_sharp,
              color: Colors.black,
              size: 26,
            ),
          ),
          const SizedBox(width: 10),
        ],
    
    );
  }
}
