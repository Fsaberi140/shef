part of 'shipping_bloc.dart';

abstract class ShippingEvent extends Equatable{

  @override
  List<Object?> get props =>[];
}

class ShippingCreateOrder extends ShippingEvent{
  final CreateOrderParams params;

  ShippingCreateOrder(this.params);

}
