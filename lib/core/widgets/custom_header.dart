import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customHeader([
  List<Widget>? actions,
  String title = 'PixelForge',
]) => AppBar(
  backgroundColor: ColorManager.white,
  foregroundColor: ColorManager.appBarTitle,
  title: Text(
    title,
    style: getBoldStyle(color: ColorManager.primary, fontsize: FontSize.s24),
  ),
  actions: actions,
);
