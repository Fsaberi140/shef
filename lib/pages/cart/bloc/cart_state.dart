part of 'cart_bloc.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartResponse cartResponse;

  CartSuccess(this.cartResponse);

  @override
  List<Object> get props=> [cartResponse];

}

class CartError extends CartState {
  final AppException exception;

  CartError(this.exception);
}
