import 'package:sheff_new/data/productTest.dart';

class CreateOrderResult {
  final int orderId;
  final String bankGatewayUrl;

  CreateOrderResult(this.orderId, this.bankGatewayUrl);

  CreateOrderResult.fromJson(Map<String, dynamic> json)
      : orderId = json['order_id'],
        bankGatewayUrl = json['bank_gateway_url'];
}

class CreateOrderParams {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String postalCode;
  final String address;
  final PaymentMethod paymentMethod;

  CreateOrderParams(this.firstName, this.lastName, this.phoneNumber,
      this.postalCode, this.address, this.paymentMethod);
}

enum PaymentMethod { online, cashDelivery }

class OrderEntity {
  final int id;
  final int payablePrice;
  final List<ProductEntity> items;

  OrderEntity(this.id, this.payablePrice, this.items);

  OrderEntity.fromJson(Map<String, dynamic > json)
      : id = json['id'],
        payablePrice = json['payable_price'],
        items = (json['items'] as List)
            .map((item) => ProductEntity.fromJson(item['product']))
            .toList();
}
