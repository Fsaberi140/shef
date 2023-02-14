import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheff_new/data/repo/cart_repository.dart';
import 'package:sheff_new/pages/cart/bloc/cart_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    cartRepository.getAll().then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData= Theme.of(context);
    final AppLocalizations? localization= AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("سبد خرید"),
      ),
      body: BlocProvider<CartBloc>(
        create: (context){
          final bloc= CartBloc(cartRepository);
          bloc.add(CartStarted());
          return bloc;
          },
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartLoading){
            return Center(child:CircularProgressIndicator(color: themeData.primaryColor,));
          }
          else if (state is CartError){
            return Center(child:Text(state.exception.message));
          }
          else if (state is CartSuccess){
            return ListView.builder(itemBuilder: (context, index) {
              return Container();

            },itemCount: state.cartResponse.cartItem.length,);
          }
          else {
           throw Exception(localization?.get);
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
