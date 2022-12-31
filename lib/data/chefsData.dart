import 'package:dio/dio.dart';

class ChefData {
  final int id;
  final String chefFirstName;
  final String chefLastName;
  final int phone;
  final String email;
  final String password;
  final String foodType;
  final int zipCode;
  final String imageChef;
  final double rate;
  final String description;
  final Function() onTap;

  ChefData(
      {required this.id,
      required this.chefFirstName,
      required this.chefLastName,
      required this.phone,
      required this.email,
      required this.password,
      required this.foodType,
      required this.zipCode,
      required this.imageChef,
      required this.rate,
      required this.description,
      required this.onTap});

  ChefData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        chefFirstName = json['chef_firstName'],
        chefLastName = json['chef_lastName'],
        foodType = json['food_type'],
        rate = json['rate'],
        email = json['email'],
        description = json['description'],
        zipCode = json['zip_code'],
        phone = json['phone'],
        password = json['password'],
        imageChef = json['image_chef'],
        onTap = json['onTap'];
}

class HttpClient {
  static Dio instance = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"));
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

class AppDataBase2 {
  static List<ChefData> get chefsData {
    return [
      ChefData(
        id: 100,
        chefFirstName: "Sami",
        chefLastName: "Lurgy",
        foodType: "Japanese Foods",
        imageChef: "chef_1.jpg",
        rate: 4.9,
        phone: 012463789045,
        email: 'sam.lur45@gmail.com',
        password: 'Sam.85690',
        zipCode: 45277,
        description:
            'I grew up in Punjab, where I learned to cook, Punjabi dishes from my mother.',
        onTap: () {},
      ),
      ChefData(
          id: 101,
          chefFirstName: "Maryam",
          chefLastName: "Saber",
          foodType: "Japanese Foods",
          imageChef: "chef_2.jpg",
          rate: 4.5,
          phone: 01246378855,
          email: 'mary.s45@gmail.com',
          password: 'Mary.85690',
          zipCode: 76679,
          description:
              'I grew up in Punjab, where I learned to cook, Punjabi dishes from my mother.',
          onTap: () {}),
      ChefData(
          id: 102,
          chefFirstName: "Ane",
          chefLastName: "Kandy",
          foodType: "Japanese Foods",
          imageChef: "chef_3.jpg",
          rate: 4.8,
          phone: 01243564782,
          email: 'ane.k45@gmail.com',
          password: 'A.85690123',
          zipCode: 51232,
          description:
              'I grew up in Punjab, where I learned to cook, Punjabi dishes from my mother.',
          onTap: () {}),
      ChefData(
          id: 103,
          chefFirstName: "Ruben",
          chefLastName: "leven",
          foodType: "Japanese Foods",
          imageChef: "chef_4.jpg",
          rate: 4.7,
          phone: 05126578522,
          email: 'rub.l98@gmail.com',
          password: 'Rub.85690',
          zipCode: 55423,
          description:
              'I grew up in Punjab, where I learned to cook, Punjabi dishes from my mother.',
          onTap: () {}),
      ChefData(
          id: 104,
          chefFirstName: "Sashi",
          chefLastName: "maryan",
          foodType: "Japanese Foods",
          imageChef: "chef_5.jpg",
          rate: 4.9,
          phone: 01246378855,
          email: 'sa.s45@gmail.com',
          password: 'Sas.85690',
          zipCode: 76679,
          description:
              'I grew up in Punjab, where I learned to cook, Punjabi dishes from my mother.',
          onTap: () {}),
      ChefData(
          id: 105,
          chefFirstName: "Anu",
          chefLastName: "swing",
          foodType: "Japanese Foods",
          imageChef: "chef_5.jpg",
          rate: 4.6,
          phone: 01232123213,
          email: 'a.s45@gmail.com',
          password: 'A.85690231',
          zipCode: 85412,
          description:
              'I grew up in Punjab, where I learned to cook, Punjabi dishes from my mother.',
          onTap: () {})
    ];
  }
}
