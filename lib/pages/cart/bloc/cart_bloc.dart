import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheff_new/common/exceptions.dart';
import 'package:sheff_new/data/cart_response.dart';
import 'package:sheff_new/data/repo/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartInitial()) {
    on<CartEvent>((event, emit) async{
      if (event is CartStarted) {
        try{
          emit (CartLoading());
        final result= await cartRepository.getAll();
        emit (CartSuccess(result));
        }catch(e){
emit(CartError(AppException()));
        }
      }
      }
    );
  }
}
