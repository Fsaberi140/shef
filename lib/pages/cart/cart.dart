import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheff_new/common/utils.dart';
import 'package:sheff_new/data/repo/cart_repository.dart';
import 'package:sheff_new/pages/auth/auth.dart';
import 'package:sheff_new/pages/cart/bloc/cart_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/pages/image.dart';

import '../../data/repo/auth_repository.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.primaryColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.cart,
          style: themeData.textTheme.headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocProvider<CartBloc>(
        create: (context) {
          final bloc = CartBloc(cartRepository);
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
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFFBE9E7),
                          blurRadius: 2,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 90,
                              height: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ImageLoadingService(
                                  imageUrl: data.product.imageUrl,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data.product.title),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.add_circle_outline_outlined)),
                                Text(data.count.toString()),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.remove_circle_outline_outlined)),
                              ],
                            ),
                            Text(data.product.price.withPriceLabel),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: state.cartResponse.cartItems.length,
            );
          } else if (state is CartError) {
            return Center(child: Text(state.exception.message));
          } else if (state is CartAuthRequired) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.cart),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (
                        context) => const AuthScreen()));
                  }, child: Text(AppLocalizations.of(context)!.login))
                ],
              ),
            );
          }
          else {
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
