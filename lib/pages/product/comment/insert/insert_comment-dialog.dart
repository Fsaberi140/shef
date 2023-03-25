import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/data/repo/comment_repository.dart';

import 'bloc/insert_comment_bloc.dart';

class InsertCommentDialog extends StatefulWidget {
  final int productId;
  final ScaffoldMessengerState? scaffoldMessenger;

  const InsertCommentDialog(
      {Key? key, required this.productId, this.scaffoldMessenger})
      : super(key: key);

  @override
  State<InsertCommentDialog> createState() => _InsertCommentDialogState();
}

class _InsertCommentDialogState extends State<InsertCommentDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  StreamSubscription? subscription;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final ThemeData themeData = Theme.of(context);

    return BlocProvider(
      create: (context) {
        final bloc = InsertCommentBloc(commentRepository, widget.productId);
        subscription = bloc.stream.listen((state) {
          if (state is InsertCommentSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
          } else if (state is InsertCommentError) {
            widget.scaffoldMessenger?.showSnackBar(
                SnackBar(content: Text(state.appException.message)));
            Navigator.of(context, rootNavigator: true).pop();
          }
        });
        return bloc;
      },
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<InsertCommentBloc, InsertCommentState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(localization.register,
                    style: themeData.textTheme.bodyText2),
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
                  onPressed: () {
                    context.read<InsertCommentBloc>().add(
                        InsertCommentFormSubmit(
                            _titleController.text, _contentController.text));
                  },
                  child: Row(
                    children: [
                      if (state is InsertCommentLoading)
                        CupertinoActivityIndicator(
                            color: themeData.colorScheme.onPrimary),
                      Text(
                        localization.save,
                        style: themeData.textTheme.headline6!
                            .apply(color: themeData.colorScheme.onSecondary),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(const Size.fromHeight(46)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        themeData.primaryColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
