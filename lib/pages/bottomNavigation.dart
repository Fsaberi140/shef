import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 5, color: Colors.black12),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/home");
            },
            child:
          BottomNavigationItem(
              iconFileName: Icons.home,
              activeIconFileName: Icons.home,
              title: "Home",
              onPressed: (){},
              isActive: false,

            ),
          ),
          BottomNavigationItem(
            iconFileName: Icons.bookmark_added_outlined,
            activeIconFileName: Icons.bookmark_added_outlined,
            title: "Books",
            onPressed: (){},
            isActive: false,

          ),
          BottomNavigationItem(
            iconFileName: Icons.emoji_food_beverage_outlined,
            activeIconFileName: Icons.emoji_food_beverage_outlined,
            title: "Orders",
            onPressed: (){},
            isActive: false,

          ),
          BottomNavigationItem(
            iconFileName: Icons.person_outline,
            activeIconFileName: Icons.person_outline,
            title: "Profile",
            onPressed: (){
              Navigator.pushNamed(context, "/profile");
            },
            isActive: false,

          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    Key? key,
    required this.iconFileName,
    required this.activeIconFileName,
    required this.title,
    required this.onPressed,
    required this.isActive,

  }) : super(key: key);

  final IconData iconFileName;
  final IconData activeIconFileName;
  final String title;
  final Function() onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(iconFileName, size: 28, color:Colors.grey[800] ),
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(),
          ),
          Text(
            title,
            style:
                themeData.textTheme.caption!.apply(color:
                isActive?themeData.colorScheme.primary
                    : Colors.grey[700],),
          )
        ],
      ),
    );
  }
}
