import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/pages/cart/price_info.dart';
import 'package:sheff_new/pages/receipt/payment_receipt.dart';

class ShippingScreen extends StatelessWidget {
  final int payablePrice;
  final int totalPrice;
  final int shippingCost;

  const ShippingScreen({Key? key,
    required this.payablePrice,
    required this.totalPrice,
    required this.shippingCost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text(localization.first)),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(label: Text(localization.last)),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(label: Text(localization.phone)),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(label: Text(localization.address)),
            ),
            const SizedBox(height: 12),
            TextField(
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
              decoration: InputDecoration(
                  label: Text(localization.instructions),
                  hintStyle: themeData.textTheme.bodyText1!.apply(
                    color: Colors.grey,
                  ),
                  hintText: AppLocalizations.of(context)!.instructionsHint),
            ),
            PriceInfo(
                payablePrice: payablePrice,
                totalPrice: totalPrice,
                shippingCost: shippingCost),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PaymentReceiptScreen()));
            }, child: Text(localization.payment))

          ],
        ),
      ),
    );
  }
}
