import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheff_new/data/productTest.dart';
import 'package:sheff_new/data/repo/product_repository.dart';
import 'package:sheff_new/pages/list/bloc/product_list_bloc.dart';
import 'package:sheff_new/pages/product/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductListScreen extends StatelessWidget {
  final int sort;

  const ProductListScreen({Key? key, required this.sort}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          localization.product,
          style: themeData.textTheme.headline5!.copyWith(
              fontWeight: FontWeight.w500, color: themeData.primaryColor),
        ),
      ),
      body: BlocProvider<ProductListBloc>(
        create: (context) =>
            ProductListBloc(productRepository)..add(ProductListStarted(sort)),
        child: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            if (state is ProductListSuccess) {
              final products = state.products;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 26, 12, 0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color:Colors.black.withOpacity(0.2),
                          blurRadius: 10)
                        ]
                      ),
                      child: Text(
                        ProductSort.names[state.sort],
                        style: themeData.textTheme.headline5!.copyWith(
                            color: themeData.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.65,
                                // width/height
                                crossAxisCount: 2),
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = products[index];
                          return ProductItem(
                              product: product,
                              borderRadius: BorderRadius.zero);
                        }),
                  ),
                ],
              );
            } else {
              return Center(
                  child: CupertinoActivityIndicator(
                      color: themeData.primaryColor));
            }
          },
        ),
      ),
    );
  }
}
