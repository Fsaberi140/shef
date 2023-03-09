part of 'payment_receipt_bloc.dart';

abstract class PaymentReceiptEvent extends Equatable{

  @override
  List<Object?> get props => [];
}

class PaymentReceiptStarted extends PaymentReceiptEvent{
  final int orderId;

  PaymentReceiptStarted(this.orderId);

  @override
  List<Object?> get props =>[orderId];
}
