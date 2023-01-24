import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheff_new/pages/home/bloc/home_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/repo/product_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        appBar: AppBar(),
        body:
          BlocBuilder<HomeBloc, HomeState>(
            builder: ((context, state) {
              if (state is HomeSuccess) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
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
                      case 1:
                        return Container();
                      case 2:
                        return Container();
                      case 3:
                        return Container();
                      case 4:
                        return Container();
                      default:
                        return Container();
                    }
                  },
                );
              } else if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
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
    );
  }
}
