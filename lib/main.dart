import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:websitespa/app/pages/home/home_controller.dart';
import 'package:websitespa/app/pages/plans/plans_controller.dart';
import 'package:websitespa/data/repositories/mock/mock_plans.dart';

import 'app/pages/home/home_screen.dart';
import 'domain/entities/menu.dart';

void main() {
  final List<Menu> menus = [
    Menu(title: 'HOME'),
    Menu(title: 'PACOTES'),
    Menu(title: 'SOBRE'),
    Menu(title: 'CONTATO')
  ];
  final getIt = GetIt.instance;
  getIt.registerSingleton<HomeController>(HomeController(
      menu: menus.first,
      menus: menus,
      title: 'NO CONFORTO \nDO SEU LAR',
      subtitle: 'VAMOS ATÉ VOCÊ!',
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."));
  getIt.registerSingleton<PlansController>(PlansController(
      plans: MockPlans().plans, title: 'Pacotes de Spa feitos para você!'));
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
