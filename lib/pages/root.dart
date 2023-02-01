import 'package:flutter/material.dart';
import 'package:sheff_new/pages/booksScreen.dart';
import '../layout/userProfile.dart';
import 'cart/cartScreen.dart';
import 'homeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ordersScreen.dart';

const int homeIndex = 0;
const int booksIndex = 1;
const int cartIndex = 2;
const int profileIndex = 3;


class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _booksKey = GlobalKey();
  final GlobalKey<NavigatorState> _cartKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();


  late final map = {
    homeIndex: _homeKey,
    booksIndex: _booksKey,
    cartIndex: _cartKey,
    profileIndex: _profileKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
    map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: IndexedStack(
            index: selectedScreenIndex,
            children: [
              _navigator(_homeKey, homeIndex, const HomeScreen()),
              _navigator(_booksKey, booksIndex, BooksScreen()),
              _navigator(_cartKey, cartIndex, const CartScreen()),
              _navigator(_profileKey, profileIndex, const UserProfile() ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type : BottomNavigationBarType.fixed,
            items:  [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home,), label: AppLocalizations.of(context)!.home),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.bookmark_added,), label:AppLocalizations.of(context)!.books ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart_rounded,), label:AppLocalizations.of(context)!.orders ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person,), label: AppLocalizations.of(context)!.profile),
            ],
            unselectedItemColor: Colors.white60,
            backgroundColor: Colors.deepOrange,
            selectedItemColor: Colors.white,
            currentIndex: selectedScreenIndex,
            onTap: (selectedIndex) {
              setState(() {
                _history.remove(selectedScreenIndex);
                _history.add(selectedScreenIndex);
                selectedScreenIndex = selectedIndex;
              });
            },
          ),
        ),
        onWillPop: _onWillPop);
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
        key: key,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => Offstage(
                offstage: selectedScreenIndex != index, child: child)));
  }
}