import 'package:flutter/material.dart';

const defaultScrollPhysics = BouncingScrollPhysics();

extension PriceLabel on int {
  String get withPriceLabel =>
      this > 0 ? '$this' : 'Free';
}