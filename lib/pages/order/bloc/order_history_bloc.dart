import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheff_new/common/exceptions.dart';
import 'package:sheff_new/data/repo/order_repository.dart';

import '../../../data/order.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final IOrderRepository repository;

  OrderHistoryBloc(this.repository) : super(OrderHistoryLoading()) {
    on<OrderHistoryEvent>((event, emit) async {
      if (event is OrderHistoryStarted){
        try{
          emit(OrderHistoryLoading());
         final orders= await repository.getOrders();
          emit(OrderHistorySuccess(orders));
        }catch(e){
          emit(OrderHistoryError(AppException()));
        }
      }
    });
  }
}
