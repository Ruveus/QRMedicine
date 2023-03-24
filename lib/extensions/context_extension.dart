
import 'package:flutter/Material.dart';

extension ContextExtension on BuildContext{
  MediaQueryData get mediaQuery=> MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext{
  double dynamicWidth(double val)=> MediaQuery.of(this).size.width*val;
  double dynamicHeight(double val)=> MediaQuery.of(this).size.width*val;
} 