import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/comment_repository.dart';
import '../../error.dart';
import 'bloc/comment_list_bloc.dart';
import 'comment.dart';


class CommentList extends StatelessWidget {
  final int productId;

  const CommentList({Key? key, required this.productId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData= Theme.of(context);
    return BlocProvider(
      create: (context) {
        final CommentListBloc bloc = CommentListBloc(
            repository: commentRepository, productId: productId);
        bloc.add(CommentListStarted());
        return bloc;
      },
      child: BlocBuilder<CommentListBloc, CommentListState>(
          builder: (context, state) {
            if (state is CommentListSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CommentItem(
                    comment: state.comments[index],
                  );
                }, childCount: state.comments.length),
              );
            } else if (state is CommentListLoading) {
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(color:themeData.primaryColor ,),
                ),
              );
            } else if (state is CommentListError) {
              return SliverToBoxAdapter(
                child: AppErrorWidget(
                  exception: state.exception,
                  onPressed: () {
                    BlocProvider.of<CommentListBloc>(context)
                        .add(CommentListStarted());
                  },
                ),
              );
            } else {
              throw Exception('state is not supported');
            }
          }),
    );
  }
}
