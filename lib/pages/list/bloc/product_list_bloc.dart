import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sheff_new/common/exceptions.dart';
import 'package:sheff_new/data/productTest.dart';
import 'package:sheff_new/data/repo/product_repository.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepository repository;

  ProductListBloc(this.repository) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async {
      if (event is ProductListStarted) {
        emit(ProductListLoading());
        try {
          final products = event.searchTerm.isEmpty
              ? await repository.getAll(event.sort)
              : await repository.search(event.searchTerm);
          if (products.isNotEmpty) {
            emit(ProductListSuccess(event.sort, products, ProductSort.names));
          } else {
            emit(ProductListEmpty('Not Found'));
          }
        } catch (e) {
          emit(ProductListError(AppException()));
        }
      }
    });
  }
}
