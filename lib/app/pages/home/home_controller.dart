import 'package:flutter/cupertino.dart';
import 'package:websitespa/domain/entities/menu.dart';

class HomeController {
  final ValueNotifier<Menu> menu;
  final String title;
  final String subtitle;
  final String text;
  final ValueNotifier<List<Menu>> menus;
  HomeController(
      {Menu menu, List<Menu> menus, String title, String subtitle, String text})
      : this.menu = ValueNotifier<Menu>(menu),
        this.menus = ValueNotifier<List<Menu>>(menus ?? []),
        this.title = title,
        this.subtitle = subtitle,
        this.text = text;
  changeMenu(Menu value) => menu.value = value;
}
