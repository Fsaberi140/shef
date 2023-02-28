import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/common/utils.dart';

class PriceInfo extends StatelessWidget {
  final int payablePrice;
  final int totalPrice;
  final int shippingCost;

  const PriceInfo(
      {Key? key,
      required this.payablePrice,
      required this.totalPrice,
      required this.shippingCost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.2))
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(localization.total),
                Text(totalPrice.withPriceLabel),
              ],
            ),
          ),
          const Divider(height: 1,),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(localization.shopping),
                Text(shippingCost.withPriceLabel),
              ],
            ),
          ),
          const Divider(height: 1,),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(localization.payment),
                Text(payablePrice.withPriceLabel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
