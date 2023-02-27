import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/common/utils.dart';


class PriceInfo extends StatelessWidget {
  final int payablePrice;
  final int totalPrice;
  final int shippingCost;

  const PriceInfo(
      {Key? key, required this.payablePrice, required this.totalPrice, required this.shippingCost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow:[BoxShadow(blurRadius: 5,
            color: Colors.black.withOpacity(0.2))
    ]),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.total),
            Text(totalPrice.withPriceLabel),
          ],
        )
      ],
    ),
    );
  }

}