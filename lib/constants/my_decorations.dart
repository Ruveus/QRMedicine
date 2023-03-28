import 'package:flutter/Material.dart';
import 'package:qr_medicine/constants/my_colors.dart';

mixin MyDecorations on MyColors {
  BoxDecoration get scaffoldContainerDecoration => BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [firstColor, secondColor],
      ));
}
