import 'package:flutter/material.dart';

class ButtonUtils {
  static BoxDecoration defaultDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    border: Border.all(color: Colors.blue),
  );

  static BoxDecoration noOutlineDecoration = defaultDecoration.copyWith(
    border: Border.all(color: Colors.transparent),
  );
}
