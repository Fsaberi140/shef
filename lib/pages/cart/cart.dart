import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheff_new/common/utils.dart';
import 'package:sheff_new/data/cart_item.dart';
import 'package:sheff_new/data/repo/cart_repository.dart';
import 'package:sheff_new/pages/auth/auth.dart';
import 'package:sheff_new/pages/cart/bloc/cart_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/pages/cart/price_info.dart';
import 'package:sheff_new/pages/image.dart';
import 'package:sheff_new/widgets/empty_state.dart';

import '../../data/repo/auth_repository.dart';
import 'cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartBloc? cartBloc;

  @override
  void initState() {
    super.initState();
    AuthRepository.authChangeNotifier.addListener(authChangeNotifierListener);
  }

  void authChangeNotifierListener() {
    cartBloc?.add(CartAuthInfoChanged(AuthRepository.authChangeNotifier.value));
  }

  @override
  void dispose() {
    AuthRepository.authChangeNotifier
        .removeListener(authChangeNotifierListener);
    cartBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.cart,
          style: themeData.textTheme.headline5!.copyWith(
              fontWeight: FontWeight.w500, color: themeData.primaryColor),
        ),
      ),
      body: BlocProvider<CartBloc>(
        create: (context) {
          final bloc = CartBloc(cartRepository);
          cartBloc = bloc;
          bloc.add(CartStarted(AuthRepository.authChangeNotifier.value));
          return bloc;
        },
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          //print(state);
          if (state is CartLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: themeData.primaryColor,
            ));
          } else if (state is CartSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index < state.cartResponse.cartItems.length) {
                  final data = state.cartResponse.cartItems[index];
                  return CartItem(
                    data: data,
                    onDeleteButtonClick: () {
                      cartBloc?.add(CartDeleteButtonClicked(data.id));
                    },
                  );
                } else {
                  return PriceInfo(
                    payablePrice: state.cartResponse.payablePrice,
                    totalPrice: state.cartResponse.totalPrice,
                    shippingCost: state.cartResponse.shippingCost,
                  );
                }
              },
              itemCount: state.cartResponse.cartItems.length + 1,
            );
          } else if (state is CartError) {
            return Center(child: Text(state.exception.message));
          } else if (state is CartAuthRequired) {
            return EmptyView(
              message: AppLocalizations.of(context)!.shopping,
              callToAction: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AuthScreen()));
                },
                child: Text(AppLocalizations.of(context)!.account),
                style:
                    ElevatedButton.styleFrom(primary: themeData.primaryColor),
              ),
              image: Image.asset(
                'assets/img/empty/cart_login_1.png',
                width: 350,
              ),
            );
          } else if (state is CartEmpty) {
            return EmptyView(
              message: AppLocalizations.of(context)!.empty,
              image: Image.asset(
                'assets/img/empty/cart_empty_1.png',
                width: 350,
              ),
            );
          } else {
            throw Exception(AppLocalizations.of(context)!.current);
          }
        }),
      ),
    );
  }
}