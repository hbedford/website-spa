import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:websitespa/app/pages/home/home_controller.dart';

class HomePageMobile extends StatelessWidget {
  final BoxConstraints constraints;
  HomePageMobile({this.constraints});
  final controller = GetIt.I.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
      height: constraints.maxHeight,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(controller.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900)),
            Text(
              controller.subtitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 8,
                  wordSpacing: 4),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * 0.05,
                ),
                child: Text(controller.text,
                    style: TextStyle(
                      height: 2,
                      fontSize: 12,
                      color: Colors.white,
                    ))),
            Spacer()
          ]),
    );
  }
}
