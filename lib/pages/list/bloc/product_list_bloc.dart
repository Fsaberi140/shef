import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sheff_new/common/exceptions.dart';
import 'package:sheff_new/data/foodsData.dart';
import 'package:sheff_new/data/productTest.dart';
import 'package:sheff_new/data/repo/product_repository.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepository repository;
  ProductListBloc(this.repository) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async{
      if (event is ProductListStarted) {
        emit (ProductListLoading());
        try{
final products = await repository.getAll(event.sort);
emit (ProductListSuccess(event.sort, products, ProductSort.names));
        }catch(e){
          emit(ProductListError(AppException()));
        }
      }
    });
  }
}
