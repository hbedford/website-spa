import 'package:flutter/cupertino.dart';
import 'package:websitespa/domain/entities/planspa.dart';

class MockPlans {
  final List<PlanSpa> plans = [
    PlanSpa(
        title: 'Familia Bawa',
        price: 299.90,
        color: Color(0xffBCC2B3),
        slogan: 'Conforto em familia ou amigos que...',
        image: AssetImage('assets/package1.jpg')),
    PlanSpa(
        title: 'Skin Repair',
        price: 129.00,
        color: Color(0xffAACDB5),
        slogan: 'Um toque especial na sua pele que...',
        image: AssetImage('assets/package2.jpg')),
    PlanSpa(
        title: 'Crystal Maiden',
        price: 349.90,
        color: Color(0xffFFBC82),
        slogan: 'Um dia de paz e tranquilidade no...',
        image: AssetImage('assets/package3.jpg'))
  ];
  MockPlans();
}
