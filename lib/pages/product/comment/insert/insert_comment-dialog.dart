import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InsertCommentDialog extends StatefulWidget {
  const InsertCommentDialog({Key? key}) : super(key: key);

  @override
  State<InsertCommentDialog> createState() => _InsertCommentDialogState();
}

class _InsertCommentDialogState extends State<InsertCommentDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final ThemeData themeData = Theme.of(context);

    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(localization.register, style: themeData.textTheme.bodyText2),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
                label: Text(localization.title,
                    style: themeData.textTheme.subtitle2)),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _contentController,
            decoration: InputDecoration(
                label: Text(localization.text,
                    style: themeData.textTheme.subtitle2)),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {},
            child: Text(
              localization.save,
              style: themeData.textTheme.headline6!
                  .apply(color: themeData.colorScheme.onSecondary),
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size.fromHeight(40)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(themeData.primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
            ),
          ),
        ],
      ),
    );
  }
}
