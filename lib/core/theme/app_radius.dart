import 'package:flutter/widgets.dart';

abstract final class AppRadius {
  AppRadius._();

  static const sm = Radius.circular(8);

  static const md = Radius.circular(12);

  static const lg = Radius.circular(18);

  static const xl = Radius.circular(24);

  static const card =
      BorderRadius.all(lg);

  static const button =
      BorderRadius.all(md);

  static const chip =
      BorderRadius.all(Radius.circular(30));
}