import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheff_new/data/repo/product_repository.dart';
import 'package:sheff_new/pages/list/bloc/product_list_bloc.dart';
import 'package:sheff_new/pages/product/product.dart';

class ProductListScreen extends StatelessWidget {
  final int sort;

  const ProductListScreen({Key? key, required this.sort}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        body: BlocProvider<ProductListBloc>(
      create: (context) =>
          ProductListBloc(productRepository)..add(ProductListStarted(sort)),
      child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListSuccess) {
            final products = state.products;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.65,
                    // width/height
                    crossAxisCount: 2),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product= products[index];
                  return ProductItem(product: product, borderRadius: BorderRadius.zero);
                });
          } else {
            return Center(
                child:
                    CupertinoActivityIndicator(color: themeData.primaryColor));
          }
        },
      ),
    ));
  }
}