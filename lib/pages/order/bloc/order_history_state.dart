part of 'order_history_bloc.dart';

abstract class OrderHistoryState extends Equatable {
  const OrderHistoryState();
}

class OrderHistoryLoading extends OrderHistoryState {
  @override
  List<Object> get props => [];
}

class OrderHistorySuccess extends OrderHistoryState {
  final List<OrderEntity> orders;

  const OrderHistorySuccess(this.orders);
  @override
  List<Object> get props => [orders];
}

class OrderHistoryError extends OrderHistoryState {
  final AppException exception;

  const OrderHistoryError(this.exception);
  @override
  List<Object> get props => [exception];
}
