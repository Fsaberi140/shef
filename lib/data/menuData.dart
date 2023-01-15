class FoodType {
  final int id;
  final Type type;
  final String name;
  final String imageFileName;
  late final bool isViewed;
  final Function() onTap;

  FoodType(
      {required this.type,
        required this.id,
      required this.name,
      required this.imageFileName,
      required this.isViewed,
      required this.onTap});

}



enum Type{
  all, iranian, japanese,korean, american, italian
}

class AppDatabase {

  static List<FoodType> get foodsType {
    return [
      FoodType(
          id: 10,
          type: Type.all,
          name: 'all',
          imageFileName: 'type_1.jpg',
          isViewed: false,
          onTap: () {}),
      FoodType(
          id: 11,
          type: Type.iranian,
          name: 'Iranian',
          imageFileName: 'type_2.jpg',
          isViewed: false,
          onTap: () {}),
      FoodType(
          id: 12,
          type: Type.japanese,
          name: 'Japanese',
          imageFileName: 'type_3.jpg',
          isViewed: true,
          onTap: () {}),
      FoodType(
          id: 13,
          type: Type.korean,
          name: 'Korean',
          imageFileName: 'type_4.jpg',
          isViewed: false,
          onTap: () {}),
      FoodType(
          id: 14,
          type: Type.american,
          name: 'American',
          imageFileName: 'type_5.jpg',
          isViewed: false,
          onTap: () {}),
      FoodType(
          id: 15,
          type: Type.iranian,
          name: 'Italian',
          imageFileName: 'type_6.jpg',
          isViewed: false,
          onTap: () {
            // updateSelectedType(Type.)

          }),
    ];
  }
}
