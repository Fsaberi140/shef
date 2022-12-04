import 'package:dio/dio.dart';

class ChefData {
  final int id;
  final String chefName;
  final String foodType;
  final String imageFood;
  final String imageChef;
  final double rate;
  final Function() onTap;

  ChefData(
      {required this.id,
        required this.chefName,
        required this.foodType,
        required this.imageFood,
        required this.imageChef,
        required this.rate,
        required this.onTap
      });
  ChefData.fromJson(Map<String,dynamic> json):id=json['id'],chefName=json['chef_name'],foodType=json['food_type'],imageFood=json['image_food'],
        rate=json['rate'],imageChef=json['image_chef'],onTap=json['onTap'];
}


class HttpClient{
  static Dio instance = Dio(BaseOptions(
      baseUrl :"https://fakestoreapi.com"
  ));
}

Future<List<ChefData>> getChefs() async {
  final response = await HttpClient.instance.get('experts/student');
  final List<ChefData> chefs = [];
  if (response.data is List<dynamic>) {
    for (var element in (response.data as List<dynamic>)) {
      chefs.add(ChefData.fromJson(element));
    }
  }
  return chefs;
}

class AppDataBase{
  static List<ChefData> get chefData{
    return [
      ChefData(
          id: 1,
          chefName: "Sami L.",
          foodType: "Japanese Foods",
          imageFood: "assets/img/foods/11.jpg",
          imageChef: "assets/img/persons/2.jpg",
          rate: 4.9,
          onTap: (){}
      ),
      ChefData(
          id: 1,
          chefName: "Maryam s.",
          foodType: "Japanese Foods",
          imageFood: "assets/img/foods/12.jpg",
          imageChef: "assets/img/persons/3.jpg",
          rate: 4.5,
          onTap: (){}
      ),
      ChefData(
          id: 1,
          chefName: "Ane k.",
          foodType: "Japanese Foods",
          imageFood: "assets/img/foods/13.jpg",
          imageChef: "assets/img/persons/4.jpg",
          rate: 4.8,
          onTap: (){}
      ),
      ChefData(
          id: 1,
          chefName: "Ruben L.",
          foodType: "Japanese Foods",
          imageFood: "assets/img/foods/14.jpg",
          imageChef: "assets/img/persons/5.jpg",
          rate: 4.7,
          onTap: (){}
      ),
      ChefData(
          id: 1,
          chefName: "Sashi M.",
          foodType: "Japanese Foods",
          imageFood: "assets/img/foods/15.jpg",
          imageChef: "assets/img/persons/6.jpg",
          rate: 4.9,
          onTap: (){}
      ),
      ChefData(
          id: 1,
          chefName: "Anu s.",
          foodType: "Japanese Foods",
          imageFood: "assets/img/foods/16.jpg",
          imageChef: "assets/img/persons/3.jpg",
          rate: 4.6,
          onTap: (){}
      )
    ];
  }
}