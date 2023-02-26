import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String message;
  final Widget? callToAction;
  final Widget image;

  const EmptyView(
      {Key? key, required this.message, this.callToAction, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image,
          Padding(
            padding: const EdgeInsets.fromLTRB(52, 34, 52, 16),
            child: Text(
              message,
              style: themeData.textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          if (callToAction != null) callToAction!
        ],
      ),
    );
  }
}
