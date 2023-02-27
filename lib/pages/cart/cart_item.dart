import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheff_new/common/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/cart_item.dart';
import '../image.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.data, required this.onDeleteButtonClick,
  }) : super(key: key);

  final CartItemEntity data;
  final GestureTapCallback onDeleteButtonClick;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFFBE9E7),
              blurRadius: 2,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageLoadingService(
                      imageUrl: data.product.imageUrl,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data.product.title),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline_outlined)),
                    Text(data.count.toString()),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_circle_outline_outlined)),
                  ],
                ),
                Text(data.product.price.withPriceLabel),
              ],
            ),
            data.deleteItemLoading
                ? const SizedBox(
                    height: 48,
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  )
                : TextButton(
                    onPressed: onDeleteButtonClick,
                    child: Text(
                      AppLocalizations.of(context)!.removeCart,
                      style: themeData.textTheme.subtitle2!
                          .copyWith(color: Color(0xff262A35)),
                    ))
          ],
        ),
      ),
    );
  }
}
