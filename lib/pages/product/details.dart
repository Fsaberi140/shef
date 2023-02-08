import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/pages/product/bloc/product_bloc.dart';

import '../../common/utils.dart';
import '../../data/productTest.dart';
import '../../data/repo/cart_repository.dart';
import '../image.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
 StreamSubscription <ProductState>? stateSubscription;
  @override
  void dispose() {
    stateSubscription?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) {
        final bloc = ProductBloc(cartRepository);
       stateSubscription= bloc.stream.listen((state) {
          if (state is ProductAddToCartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context)!.successfully)));}
            else if (state is ProductAddToCartError){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.exception.message)));
          }

        });
        return bloc;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width - 48,
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<ProductBloc>(context)
                      .add(CartAddButtonClick(widget.product.id));
                },
                label: state is ProductAddToCartButtonLoading
                    ? CupertinoActivityIndicator(
                        color: Theme.of(context).primaryColor)
                    : Text(AppLocalizations.of(context)!.add),
              );
            },
          ),
        ),
        body: CustomScrollView(
          physics: defaultScrollPhysics,
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.width * 0.8,
              flexibleSpace: ImageLoadingService(imageUrl: widget.product.imageUrl),
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
                          'نظرات کاربران',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('ثبت نظر'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // CommentList(productId: product.id),
          ],
        ),
      ),
    );
  }
}
