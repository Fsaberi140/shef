import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/pages/list/list.dart';

import '../../data/productTest.dart';
import '../../common/utils.dart';
import '../../data/repo/banner_repository.dart';
import '../../data/repo/product_repository.dart';
import '../../layout/drawer.dart';
import '../../widgets/slider.dart';
import '../error.dart';
import '../product/product.dart';
import '../searchScreen.dart';
import 'bloc/home_bloc.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  final TextEditingController _searchController= TextEditingController();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final ThemeData themeData = Theme.of(context);
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(
            bannerRepository: bannerRepository,
            productRepository: productRepository);
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
      child: Scaffold(
        key: _key,
        appBar: _appBar(themeData, context),
        body: BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
          if (state is HomeSuccess) {
            return ListView.builder(
                physics: defaultScrollPhysics,
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    ClipRRect(
                                        child: Image.asset(
                                          'assets/img/foods/food_1.jpg',
                                          width: 130,
                                        )),
                                    Text(
                                      localization.foods,
                                      style: themeData.textTheme.headline6,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(80),
                                        child: Image.asset(
                                          'assets/img/sweets/sweet_1.jpg',
                                          width: 130,
                                        )),
                                    Text(localization.sweets,
                                        style: themeData.textTheme.headline6),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              height: 0,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),
                      );

                    case 2:
                      return BannerSlider(
                        banners: state.banners,
                      );

                    case 3:
                      return _HorizontalProductList(
                        title: localization.favorites,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                              const ProductListScreen(
                                  sort: ProductSort.popular)));
                        },
                        products: state.popularProducts,
                      );
                    case 4:
                      return _HorizontalProductList(
                        title: localization.newest,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                              const ProductListScreen(
                                  sort: ProductSort.latest)));
                        },
                        products: state.latestProducts,
                      );
                    default:
                      return Container();
                  }
                });
          } else if (state is HomeLoading) {
            return Center(
                child: CircularProgressIndicator(
                  color: themeData.primaryColor,
                ));
          } else if (state is HomeError) {
            return AppErrorWidget(
              exception: state.exception,
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(HomeRefresh());
              },
            );
          } else {
            throw Exception('state is not supported');
          }
        })),
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
      ),
    );
  }

  AppBar _appBar(ThemeData themeData, BuildContext context) {
    final TextEditingController _searchController= TextEditingController();
    return AppBar(
        backgroundColor: themeData.primaryColor,
        elevation: 2,
        shadowColor: themeData.primaryColor,
        leading: IconButton(
          onPressed: () => {_key.currentState!.openDrawer()},
          icon: const Icon(Icons.menu, color: Colors.white, size: 26),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/root");
            },
            child: Text(AppLocalizations.of(context)!.header,
                style: themeData.textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: themeData.colorScheme.onSecondary)),
          ),
        ),
        actions: [
          SizedBox(
              height: 46,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    isCollapsed: false,
                    prefixIcon: IconButton(
                        onPressed: ()
                        {
                        _search(context);
                        },
                        icon: const Icon(Icons.search,
                            color: Colors.white, size: 26)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.deepOrange, width: 2)),
                    floatingLabelBehavior: FloatingLabelBehavior.never),
                textInputAction: TextInputAction.search,
                cursorColor: Colors.deepOrange,
                style: themeData.textTheme.bodyText2,
                onSubmitted: (value){
                  _search(context);
                },
              )),
        ]);
  }

  void _search(BuildContext context) {
    final TextEditingController _searchController= TextEditingController();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductListScreen.search(searchTerm: _searchController.text,)));
  }
}

class _HorizontalProductList extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final List<ProductEntity> products;

  const _HorizontalProductList({
    Key? key,
    required this.title,
    required this.onTap,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: themeData.textTheme.headline5!.copyWith(
                    color: themeData.primaryColor, fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: onTap,
                  child: Text(
                    AppLocalizations.of(context)!.view,
                    style: themeData.textTheme.caption,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 310,
          child: ListView.builder(
              physics: defaultScrollPhysics,
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 8, right: 8),
              itemBuilder: ((context, index) {
                final product = products[index];
                return ProductItem(
                  product: product,
                  borderRadius: BorderRadius.circular(12),
                );
              })),
        )
      ],
    );
  }
}
