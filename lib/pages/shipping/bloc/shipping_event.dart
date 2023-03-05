part of 'shipping_bloc.dart';

abstract class ShippingEvent extends Equatable{

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ShippingCreateOrder extends ShippingEvent{
  final CreateOrderParams params;

  ShippingCreateOrder(this.params);

}
