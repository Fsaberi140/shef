import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/data/order.dart';
import 'package:sheff_new/data/repo/order_repository.dart';
import 'package:sheff_new/pages/cart/price_info.dart';
import 'package:sheff_new/pages/receipt/payment_receipt.dart';
import 'package:sheff_new/pages/shipping/bloc/shipping_bloc.dart';

import '../payment-webview/payment_webview.dart';

class ShippingScreen extends StatefulWidget {
  final int payablePrice;
  final int totalPrice;
  final int shippingCost;

  const ShippingScreen({
    Key? key,
    required this.payablePrice,
    required this.totalPrice,
    required this.shippingCost,
  }) : super(key: key);

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  final TextEditingController firstNameController =
  TextEditingController(text: '');

  final TextEditingController lastNameController =
  TextEditingController(text: '');

  final TextEditingController phoneNumberController =
  TextEditingController(text: '');

  final TextEditingController postalCodeController =
  TextEditingController(text: '');

  final TextEditingController addressController =
  TextEditingController(text: '');

  StreamSubscription? subscription;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: BlocProvider<ShippingBloc>(
        create: (context) {
          final bloc = ShippingBloc(orderRepository);
          subscription = bloc.stream.listen((event) {
            if (event is ShippingError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(event.appException.message)));
            } else if (event is ShippingSuccess) {
              if (event.result.bankGatewayUrl.isNotEmpty) {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    PaymentGatewayScreen(
                      bankGatewayUrl: event.result.bankGatewayUrl,)));
              }else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PaymentReceiptScreen(
                          orderId: event.result.orderId,
                        )));
              }
            }
          });
          return bloc;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(label: Text(localization.first)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(label: Text(localization.last)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(label: Text(localization.phone)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: addressController,
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
                  payablePrice: widget.payablePrice,
                  totalPrice: widget.totalPrice,
                  shippingCost: widget.shippingCost),
              const SizedBox(height: 12),
              BlocBuilder<ShippingBloc, ShippingState>(
                builder: (context, state) {
                  return state is ShippingLoading
                      ? Center(
                    child: CupertinoActivityIndicator(
                      color: themeData.primaryColor,
                    ),
                  )
                      : ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ShippingBloc>(context)
                            .add(ShippingCreateOrder(CreateOrderParams(
                          firstNameController.text,
                          lastNameController.text,
                          phoneNumberController.text,
                          addressController.text,
                          postalCodeController.text,
                          PaymentMethod.online,
                        )));
                      },
                      child: Text(localization.payment));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
