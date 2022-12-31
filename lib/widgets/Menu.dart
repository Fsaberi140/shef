import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sheff_new/data/menuData.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => MenuState();
}

class MenuState extends State<Menu> {
  Type foodType = Type.all;

  void updateSelectedType(Type type) {
    setState(() {
      foodType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final foodsType = AppDatabase.foodsType;

    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: foodsType.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final foodType = foodsType[index];
            return Foods(themeData: themeData, foodType: foodType);
          }),
    );
  }
}



class Foods extends StatefulWidget {
  final ThemeData themeData;
  final FoodType foodType;
  const Foods({
    Key? key,
    required this.themeData,
    required this.foodType,
  }) : super(key: key);

  @override
  State<Foods> createState() => _FoodsState();
}
class _FoodsState extends State<Foods> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(4, 5, 4, 0),
        child: Column(children: [
          Stack(children: [
            widget.foodType.isViewed ? _foodImageViewed(context) : _foodImageNormal(),
          ]),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.foodType.name,
            style: widget.themeData.textTheme.subtitle2!
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
          color: widget.themeData.primaryColor),
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
      width: 70,
      height: 53,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: widget.themeData.primaryColor,
        dashPattern: const [5],
        radius: const Radius.circular(20),
        padding: const EdgeInsets.all(3.5),
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
        'assets/img/types/${widget.foodType.imageFileName}',
      ),
    );
  }
}


