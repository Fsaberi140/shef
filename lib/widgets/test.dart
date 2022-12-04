import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sheff_new/data.dart';

class Test extends StatefulWidget {
  const Test({
    Key? key,
    // required this.themeData,

  }) : super(key: key);
  // final ThemeData themeData;

  @override
  State<Test> createState() => _TestState();
}
enum Type{
  all,
  iranian,
  japanese,
  korean,
  american,
  italian,
}

class _TestState extends State<Test> {
  Type type = Type.all;
  void updateSelectedType (Type fType){
setState(() {
  type= fType;

});
  }


  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    final foodsType = AppDatabase.foodsType;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: SizedBox(
            height: 110,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
                itemCount: foodsType.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final foodType = foodsType[index];
                  return Foods(themeData: themeData, foodType: foodType);
                }),
          ),
        ),
      ),
    ));
  }
}

class Foods extends StatelessWidget {
  const Foods({
    Key? key,
    required this.themeData,
    required this.foodType,
  }) : super(key: key);

  final ThemeData themeData;
  final FoodType foodType;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.fromLTRB(4, 5, 3, 5),
        child: Column(children: [
          Stack(children: [
            foodType.isViewed? _foodImageViewed(context) : _foodImageNormal(),
          ]),
          const SizedBox(
            height: 5,
          ),
          Text(
            foodType.name,
            style: themeData.textTheme.subtitle2!
                .copyWith(fontSize: 14, color: Colors.black87),
          ),
        ]),
      ),
    );
  }

  Widget _foodImageNormal() {
    return Container(
      width: 70,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeData.primaryColor
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        padding: const EdgeInsets.all(3),
        child: foodImage(),
      ),
    );
  }

  Widget _foodImageViewed(BuildContext context) {
    return SizedBox(
      width:70 ,
      height: 55,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: themeData.primaryColor,
        dashPattern: const [5],
        radius: const Radius.circular(20),
        padding:const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),

          ),
          child: foodImage(),
        ),
      ),
    );
  }

  Widget foodImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        'assets/img/types/${foodType.imageFileName}',
      ),
    );
  }
}
