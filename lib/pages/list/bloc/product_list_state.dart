part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState extends Equatable{
  @override
  List<Object?> get props =>[];
}

class ProductListLoading extends ProductListState{}

class ProductListSuccess extends ProductListState{
  final int sort;
  final List<ProductEntity> products;
  final List<String> sortName;

  ProductListSuccess(this.sort, this.products, this.sortName);

  @override
  List<Object?> get props => [sort,products,sortName];
}

class ProductListError extends ProductListState{
  final AppException exception;

  ProductListError(this.exception);

  @override
  List<Object?> get props => [exception];
}

class ProductListEmpty extends ProductListState{
  final String message;

  ProductListEmpty(this.message);

  @override
  List<Object?> get props => [message];
}