import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheff_new/pages/home/bloc/home_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/utils.dart';
// import '../../data/foodsData.dart';
import '../../data/productTest.dart';
import '../../data/repo/product_repository.dart';
import '../searchScreen.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(productRepository: productRepository);
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
      child: Scaffold(
        // key: _key,
        appBar: _appBar(themeData, context),
        body: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: ((context, state) {
              if (state is HomeSuccess) {
                return ListView.builder(
                  physics: defaultScrollPhysics,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Row(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                    // borderRadius:BorderRadius.,
                                    child: Image.asset(
                                  'assets/img/sweets/sweets_1.jpg',
                                  width: 100,
                                )),
                                Text(
                                  AppLocalizations.of(context)!.sweets,
                                  style: themeData.textTheme.headline5!
                                      .copyWith(color: themeData.primaryColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                ClipRRect(
                                    // borderRadius:BorderRadius.,
                                    child: Image.asset(
                                  'assets/img/sweets/sweets_1.jpg',
                                  width: 100,
                                )),
                                Text(
                                  AppLocalizations.of(context)!.newest,
                                  style: themeData.textTheme.headline5!
                                      .copyWith(color: themeData.primaryColor),
                                ),
                              ],
                            ),
                          ],
                        );
                      case 1:
                        return Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.newest,
                              style: themeData.textTheme.headline5!
                                  .copyWith(color: themeData.primaryColor),
                            ),
                            const SizedBox(height: 8),
                            ListView.builder(
                                itemBuilder: ((context, index) => Container(
                                      width: 300,
                                      height: 200,
                                    )))
                          ],
                        );
                      case 2:
                        return _HorizontalProductList(
                          title: 'جدیدترین',
                          onTap: () {},
                          products: state.latestProducts,
                        );
                      case 3:
                        return _HorizontalProductList(
                          title: 'پربازدیدترین',
                          onTap: () {},
                          products: state.popularProducts,
                        );
                      case 4:
                        return Container(
                          height: 100,
                          width: 300,
                        );
                      default:
                        return Container(
                          height: 100,
                          width: 300,
                        );
                    }
                  },
                );
              } else if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white),),);
              } else if (state is HomeError) {
                return Center(
                  child: Column(
                    children: [
                      Text(state.exception.message),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(HomeRefresh());
                        },
                        child: Text(AppLocalizations.of(context)!.refresh),
                      )
                    ],
                  ),
                );
              } else {
                return const Text("developer");
              }
            }),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(ThemeData themeData, BuildContext context) {
    return AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 2,
        shadowColor: themeData.primaryColor,
        leading: IconButton(
          onPressed: () => {
            // _key.currentState!.openDrawer()
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 26,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/root");
            },
            child: Text(AppLocalizations.of(context)!.header,
                style: themeData.textTheme.headline5!.copyWith(fontWeight: FontWeight.w600)),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) =>
                        const SearchScreen())),
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 26,
              )),
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.subtitle1),
              TextButton(onPressed: onTap, child: const Text('مشاهده همه'))
            ],
          ),
        ),
        SizedBox(
          height: 290,
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




