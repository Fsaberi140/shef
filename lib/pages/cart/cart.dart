import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheff_new/common/utils.dart';
import 'package:sheff_new/data/cart_item.dart';
import 'package:sheff_new/data/repo/cart_repository.dart';
import 'package:sheff_new/pages/auth/auth.dart';
import 'package:sheff_new/pages/cart/bloc/cart_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/pages/image.dart';
import 'package:sheff_new/widgets/empty_state.dart';

import '../../data/repo/auth_repository.dart';

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
                final data = state.cartResponse.cartItems[index];
                return CartItem(data: data);
              },
              itemCount: state.cartResponse.cartItems.length,
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
                'assets/img/empty/login-1.jpg',
                width: 350,
              ),
            );
          } else if (state is CartEmpty) {
            return EmptyView(
              message: AppLocalizations.of(context)!.empty,
              image: Image.asset(
                'assets/img/empty/cart-empty.png',
                width: 350,
              ),
            );
          } else {
            throw Exception(AppLocalizations.of(context)!.current);
          }
        }),
      ),
      // ValueListenableBuilder<AuthInfo?>(
      //   valueListenable: AuthRepository.authChangeNotifier,
      //   builder: (context, authState, child) {
      //     bool isAuthenticated =
      //         authState != null && authState.accessToken.isNotEmpty;
      //     return SizedBox(
      //       width: MediaQuery.of(context).size.width,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Text(isAuthenticated
      //               ? 'خوش آمدید'
      //               : 'لطفا وارد حساب کاربری خود شوید'),
      //           isAuthenticated
      //               ? ElevatedButton(
      //                   onPressed: () {
      //                     authRepository.signOut();
      //                   },
      //                   child: const Text('خروج از حساب'))
      //               : ElevatedButton(
      //                   onPressed: () {
      //                     Navigator.of(context, rootNavigator: true).push(
      //                         MaterialPageRoute(
      //                             builder: (context) => const AuthScreen()));
      //                   },
      //                   child: const Text('ورود')),
      //           ElevatedButton(
      //               onPressed: () async {
      //                 await authRepository.refreshToken();
      //               },
      //               child: const Text('Refresh Token')),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

