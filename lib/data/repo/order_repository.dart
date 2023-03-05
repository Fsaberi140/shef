import 'package:sheff_new/data/order.dart';
import 'package:sheff_new/data/source/order_data_source.dart';

import '../../common/http_client.dart';

final orderRepository = OrderRepository(OrderRemoteDataSource(httpClient));

abstract class IOrderRepository extends IOrderDataSource {}

class OrderRepository implements IOrderRepository {
  final IOrderDataSource dataSource;

  OrderRepository(this.dataSource);

  @override
  Future<CreateOrderResult> create(CreateOrderParams params){
    return dataSource.create(params);
  }
}
