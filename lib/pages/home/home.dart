import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                      return Row(
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
                                AppLocalizations.of(context)!.foods,
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
                              Text(AppLocalizations.of(context)!.sweets,
                                  style: themeData.textTheme.headline6),
                            ],
                          ),
                        ],
                      );
                    case 1:
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 15),
                        child: Divider(
                          thickness: 2,
                          height: 0,
                          color: Colors.grey[300],
                        ),
                      );

                    case 2:
                      return BannerSlider(
                        banners: state.banners,
                      );

                    case 3:
                      return _HorizontalProductList(
                        title: AppLocalizations.of(context)!.favorites,
                        onTap: () {},
                        products: state.latestProducts,
                      );
                    case 4:
                      return _HorizontalProductList(
                        title: AppLocalizations.of(context)!.newest,
                        onTap: () {},
                        products: state.popularProducts,
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
          IconButton(
              onPressed: () =>
              {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen())),
              },
              icon: const Icon(Icons.search, color: Colors.white, size: 26)),
          const SizedBox(width: 10),
        ]);
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
