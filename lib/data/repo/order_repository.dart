import 'package:sheff_new/data/order.dart';
import 'package:sheff_new/data/payment_receipt.dart';
import 'package:sheff_new/data/source/order_data_source.dart';

import '../../common/http_client.dart';

final orderRepository = OrderRepository(OrderRemoteDataSource(httpClient));

abstract class IOrderRepository extends IOrderDataSource {}

class OrderRepository implements IOrderRepository {
  final IOrderDataSource orderDataSource;

  OrderRepository(this.orderDataSource);

  @override
  Future<CreateOrderResult> create(CreateOrderParams params){
    return orderDataSource.create(params);
  }

  @override
  Future<PaymentReceiptData> getPaymentReceipt(int orderId) {
    return orderDataSource .getPaymentReceipt(orderId);
  }
}
