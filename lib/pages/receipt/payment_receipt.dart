import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/common/utils.dart';
import 'package:sheff_new/data/repo/order_repository.dart';

import 'bloc/payment_receipt_bloc.dart';

class PaymentReceiptScreen extends StatelessWidget {
  final int orderId;

  const PaymentReceiptScreen({Key? key, required this.orderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocProvider<PaymentReceiptBloc>(
        create: (context) => PaymentReceiptBloc(orderRepository)
          ..add(PaymentReceiptStarted(orderId)),
        child: BlocBuilder<PaymentReceiptBloc, PaymentReceiptState>(
          builder: (context, state) {
            if (state is PaymentReceiptSuccess) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        state.paymentReceiptData.purchaseSuccess?Text(localization.paymentSuccessful):Text(localization.paymentSuccessful),
                        // paymentFailed,
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(localization.status),
                            Text(state.paymentReceiptData.paymentStatus),
                          ],
                        ),
                        const Divider(height: 32, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(localization.amount),
                            Text(state.paymentReceiptData.payablePrice.withPriceLabel),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: Text(localization.toHome))
                ],
              );
            } else if (state is PaymentReceiptError) {
              return Center(child: Text(state.exception.message));
            } else if (state is PaymentReceiptLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else {
              throw Exception('state is not supported');
            }
          },
        ),
      ),
    );
  }
}
