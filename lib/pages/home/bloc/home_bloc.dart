import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sheff_new/common/exceptions.dart';
import 'package:sheff_new/data/repo/product_repository.dart';
import 'package:sheff_new/data/productTest.dart';

import '../../../data/banner.dart';
import '../../../data/repo/banner_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IProductRepository productRepository;

  HomeBloc({required this.productRepository}) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted || event is HomeRefresh) {
        try {
          emit(HomeLoading());
          final latestProducts =
              await productRepository.getAll(ProductSort.latest);
          final popularProducts =
              await productRepository.getAll(ProductSort.popular);
          final banners = await bannerRepository.getAll();
          emit(HomeSuccess(
              latestProducts: latestProducts,
              popularProducts: popularProducts,
              banners: banners));
        } catch (e) {
          emit(HomeError(
              exception:
                  e is AppException ? e : AppException(message: 'error')));
        }
      }
    });
  }
}
