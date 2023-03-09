part of 'payment_receipt_bloc.dart';

abstract class PaymentReceiptState extends Equatable{

  @override
  List<Object?> get props => [];
}

class PaymentReceiptLoading extends PaymentReceiptState {}

class PaymentReceiptSuccess extends PaymentReceiptState {
  final PaymentReceiptData paymentReceiptData;

  PaymentReceiptSuccess(this.paymentReceiptData);


  @override
  List<Object?> get props => [paymentReceiptData];
}

class PaymentReceiptError extends PaymentReceiptState {
  final AppException exception;

  PaymentReceiptError(this.exception);

  @override
  List<Object?> get props => [exception];
}
