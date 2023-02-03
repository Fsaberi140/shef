import 'package:flutter/material.dart';
import '../../common/exceptions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppErrorWidget extends StatelessWidget {
  final AppException exception;
  final GestureTapCallback onPressed;
  const AppErrorWidget({
    Key? key,
    required this.exception,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(exception.message),
          ElevatedButton(
              onPressed: onPressed, child: Text(AppLocalizations.of(context)!.refresh)),
        ],
      ),
    );
  }
}