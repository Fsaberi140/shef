class ProductEntity {
  final int id;
  final String imageFood1;
  final String foodName;
  final String service;
  final String foodstuffs;
  final double price;
  final double rate;
  final double discount;
  final Function() onTap;

  ProductEntity({
    required this.id,
    required this.imageFood1,
    required this.foodName,
    required this.service,
    required this.price,
    required this.foodstuffs,
    required this.rate,
    required this.discount,
    required this.onTap
  });
  ProductEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageFood1 = json['image_food1'],
        foodName = json['food_name'],
        service = json['service'],
        rate = json['rate'],
        price = json['price'],
        foodstuffs = json['foodstuffs'],
        discount = json['discount'],
        onTap = json['onTap'];
}

class AppDataBase1 {
  static List<ProductEntity> get foodsData {
    return [
      ProductEntity(
          id: 1000,
          imageFood1: "foodData_1.jpg",
          foodName: "Asian Chicken Salad Meal",
          service: "1 Main, 1 Side, 1 Dessert",
          price: 25.98,
          rate: 4.9,
          foodstuffs:"spinach, eggs, potatoes and cheese",
          discount: 0,
          onTap: () {}
      ),
      ProductEntity(
          id: 1001,
          imageFood1: "foodData_2.jpg",
          foodName: "Asian Chicken Salad Meal",
          service: "1 Main, 1 Side, 1 Dessert",
          price: 24.80,
          rate: 4.7,
          foodstuffs:"spinach, eggs, potatoes and cheese",
          discount: 0,
          onTap: () {}
      ),
      ProductEntity(
          id: 1002,
          imageFood1: "foodData_3.jpg",
          foodName: "Asian Chicken Salad Meal",
          service: "1 Main, 1 Side, 1 Dessert",
          price: 20.30,
          rate: 4.6,
          foodstuffs:"spinach, eggs, potatoes and cheese",
          onTap: () {},
          discount: 0
      ),
      ProductEntity(
          id: 1003,
          imageFood1: "foodData_4.jpg",
          foodName: "Asian Chicken Salad Meal",
          service: "1 Main, 1 Side, 1 Dessert",
          price: 10.13,
          rate: 4.8,
          foodstuffs:"spinach, eggs, potatoes and cheese",
          onTap: () {},
          discount: 0
      ),
      ProductEntity(
          id: 1004,
          imageFood1: "foodData_5.jpg",
          foodName: "Asian Chicken Salad Meal",
          service: "1 Main, 1 Side, 1 Dessert",
          price: 18.10,
          rate: 4.5,
          foodstuffs:"spinach, eggs, potatoes and cheese",
          onTap: () {},
          discount: 0
      ),
      ProductEntity(
          id: 1005,
          imageFood1: "foodData_6.jpg",
          foodName: "Asian Chicken Salad Meal",
          service: "1 Main, 1 Side, 1 Dessert",
          price: 15.18,
          rate: 4.9,
          foodstuffs:"spinach, eggs, potatoes and cheese",
          onTap: () {},
          discount: 0
      ),
    ];
  }
}