part of 'shipping_bloc.dart';

abstract class ShippingState extends Equatable{

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ShippingInitial extends ShippingState {}

class ShippingLoading extends ShippingState {

}

class ShippingError extends ShippingState {
  final AppException appException;

  ShippingError(this.appException);

  @override
  List<Object?> get props => [appException];
}

class ShippingSuccess extends ShippingState {
  final CreateOrderResult result;

  ShippingSuccess(this.result);

  @override
  List<Object?> get props => [result];
}
