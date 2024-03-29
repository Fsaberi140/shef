import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/pages/product/bloc/product_bloc.dart';
import 'package:sheff_new/pages/product/comment/insert/insert_comment-dialog.dart';

import '../../common/utils.dart';
import '../../data/productTest.dart';
import '../../data/repo/cart_repository.dart';
import '../image.dart';
import 'comment/commentList.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  StreamSubscription<ProductState>? stateSubscription;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void dispose() {
    stateSubscription?.cancel();
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return BlocProvider<ProductBloc>(
      create: (context) {
        final bloc = ProductBloc(cartRepository);
        stateSubscription = bloc.stream.listen((state) {
          if (state is ProductAddToCartSuccess) {
            _scaffoldKey.currentState?.showSnackBar(
                SnackBar(content: Text(localization.successfully)));
          } else if (state is ProductAddToCartError) {
            _scaffoldKey.currentState?.showSnackBar(
                SnackBar(content: Text(state.exception.message)));
          }
        });
        return bloc;
      },
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return FloatingActionButton.extended(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    BlocProvider.of<ProductBloc>(context)
                        .add(CartAddButtonClick(widget.product.id));
                  },
                  label: state is ProductAddToCartButtonLoading
                      ? CupertinoActivityIndicator(
                          color: Theme.of(context).primaryColor)
                      : Text(localization.add),
                );
              },
            ),
          ),
          body: CustomScrollView(
            physics: defaultScrollPhysics,
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.width * 0.8,
                flexibleSpace:
                    ImageLoadingService(imageUrl: widget.product.imageUrl),
                foregroundColor: Colors.black87,
                // LightThemeColors.primaryTextColor,
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(CupertinoIcons.heart))
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            widget.product.title,
                            style: Theme.of(context).textTheme.headline6,
                          )),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     Text(
                          //       product.previousPrice.withPriceLabel,
                          //       style: Theme.of(context).textTheme.caption!.apply(
                          //           decoration: TextDecoration.lineThrough),
                          //     ),
                          //     Text(product.price.withPriceLabel),
                          //   ],
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'این کتونی شدیدا برای دویدن و راه رفتن مناسب هست و تقریبا. هیچ فشار مخربی رو نمیذارد به پا و زانوان شما انتقال داده شود',
                        style: TextStyle(height: 1.4),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localization.reviews,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16))),
                                    useRootNavigator: true,
                                    builder: (context) {
                                      return  InsertCommentDialog(
                                        productId: widget.product.id,
                                        scaffoldMessenger:
                                            _scaffoldKey.currentState,
                                      );
                                    });
                              },
                              child: Text(localization.register,
                                  style: themeData.textTheme.caption))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CommentList(productId: widget.product.id),
            ],
          ),
        ),
      ),
    );
  }
}
