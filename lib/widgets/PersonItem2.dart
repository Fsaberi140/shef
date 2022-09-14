import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class PersonItem2 extends StatelessWidget {
  const PersonItem2({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _image(),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _row1(context),
              const SizedBox(
                height: 8
              ),
              _row2(context),
              const SizedBox(
                height: 8
              ),
              _row3(context),
              const SizedBox(
                height: 15
              ),
              _addButton$bookmark(context),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _addButton$bookmark(BuildContext context) {
    return Row(
              children: [
                ElevatedButton(
                  child: Text(
                    AppLocalizations.of(context)!.add,
                    style: themeData.textTheme.bodyText1!
                        .apply(color: Colors.white),
                  ),
                  onPressed: () {
                  },
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    minimumSize: MaterialStateProperty.all(
                      const Size(160, 38),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        themeData.primaryColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                  ),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.bookmark_border,
                        // icon.isBookmarket?
                        //     Icons.bookmark
                        //     :Icons.bookmark_border,
                        color: themeData.primaryColor,
                        size: 28,
                      ),
                    ))
              ],
            );
  }

  Widget _row3(BuildContext context) {
    return InkWell(
              onTap: () {},
              child: Text(
                AppLocalizations.of(context)!.details,
                style: themeData.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
  }

  Widget _row2(BuildContext context) {
    return Text(
              AppLocalizations.of(context)!.include,
              style: themeData.textTheme.subtitle2,
            );
  }

  Widget _row1(BuildContext context) {
    return Row(
              children: [
                Expanded(
                  child: Text(AppLocalizations.of(context)!.asian,
                      style: themeData.textTheme.subtitle1),
                ),
                Text(AppLocalizations.of(context)!.price,
                    style: themeData.textTheme.subtitle2!
                        .apply(color: Colors.black)),
              ],
            );
  }

  Widget _image() {
    return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
        child: Image.asset(
          'assets/img/foods/31.jpg',
          width: 360,
          height: 240,
        ),
      );
  }
}
