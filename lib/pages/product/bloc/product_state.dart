part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductAddToCartButtonLoading extends ProductState{

}

class ProductAddToCartError extends ProductState{
  final AppException exception;

  ProductAddToCartError(this.exception);

  @override
  List<Object> get props=> [exception];
}

class ProductAddToCartSuccess extends ProductState{

}
