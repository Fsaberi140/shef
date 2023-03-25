part of 'product_list_bloc.dart';

@immutable
abstract class ProductListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductListStarted extends ProductListEvent {
  final int sort;
  final String searchTerm;

  ProductListStarted(this.sort, this.searchTerm);

  @override
  List<Object?> get props => [sort];
}
