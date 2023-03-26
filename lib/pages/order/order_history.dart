import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/common/utils.dart';
import 'package:sheff_new/data/repo/order_repository.dart';
import 'package:sheff_new/pages/image.dart';

import 'bloc/order_history_bloc.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) =>
          OrderHistoryBloc(orderRepository)..add(OrderHistoryStarted()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            localization.orders,
            style: themeData.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w500, color: themeData.primaryColor),
          ),
        ),
        body: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
            builder: (context, state) {
          if (state is OrderHistorySuccess) {
            final orders = state.orders;
            return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Container(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          height: 56,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("شناسه سفارش"),
                              Text(order.id.toString()),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          height: 56,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(localization.price),
                              Text(order.payablePrice.withPriceLabel),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        SizedBox(
                            height: 132,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: order.items.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.all(8),
                                    child: ImageLoadingService(imageUrl: order.items[index].imageUrl,),
                                  );
                                })),
                      ],
                    ),
                  );
                });
          } else if (state is OrderHistoryError) {
            return Center(child: Text(state.exception.message));
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: themeData.primaryColor,
            ));
          }
        }),
      ),
    );
  }
}
