import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:websitespa/app/pages/home/home_controller.dart';
import 'package:websitespa/app/pages/plans/plans_controller.dart';
import 'package:websitespa/app/pages/plans/widgets/plan_widget.dart';

class HomeDesktop extends StatelessWidget {
  final controller = GetIt.I.get<HomeController>();
  final TextStyle style = TextStyle(
    color: Color(0xFFBECCAB),
    fontWeight: FontWeight.w900,
    letterSpacing: 2,
  );
  final controllerPlan = GetIt.I.get<PlansController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraint) => Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
                left: -constraint.maxWidth * 0.25,
                top: -constraint.maxHeight * 0.2,
                child: Image.asset(
                  'assets/plant1.jpg',
                  fit: BoxFit.fitHeight,
                )),
            Positioned(
                left: constraint.maxWidth * 0.6,
                child: Container(
                  height: constraint.maxHeight,
                  width: constraint.maxWidth * 0.4,
                  color: Color(0xFFD9DCD8),
                )),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: constraint.maxHeight * 0.2,
                    margin: EdgeInsets.only(
                        left: constraint.maxWidth * 0.025,
                        top: constraint.maxHeight * 0.01),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          topLeftSide(constraint),
                          topRightSide(constraint),
                        ]),
                  ),
                  centerContainer(constraint),
                  bottomContainer(constraint),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  topLeftSide(BoxConstraints constraint) => Expanded(
        flex: 6,
        child: Container(
          height: constraint.maxHeight * 0.1,
          /*  color: Colors.blue,
                          margin: EdgeInsets.only(
                              left: constraint.maxWidth * 0.025,
                              top: constraint.maxHeight * 0.01), */
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Image.asset('assets/logo.png')),
              Expanded(
                flex: 4,
                child: Container(
                  /*  color: Colors.blue, */
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: controller.menus.value
                          .map(
                            (e) => TextButton(
                              onPressed: () => null,
                              child: Text(
                                e.title,
                                style: style.copyWith(color: Colors.black),
                              ),
                            ),
                          )
                          .toList()),
                ),
              )
            ],
          ),
        ),
      );
  topRightSide(BoxConstraints constraint) => Expanded(
        flex: 4,
        child: Container(
          height: constraint.maxHeight * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            /*  mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, */
            children: [
              Flexible(
                child: TextButton(
                    onPressed: () => null,
                    child: Image.asset(
                      'assets/icon_cart.png',
                      scale: 2,
                    )),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: null,
                    child: Image.asset(
                      'assets/lupa.png',
                      scale: 2,
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Image.asset(
                      'assets/avatar.png',
                      scale: 2,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
  centerContainer(BoxConstraints constraint) => Container(
        height: constraint.maxHeight * 0.5,
        child: Row(
          children: [
            Expanded(flex: 6, child: Container()),
            Flexible(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: constraint.maxWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  controller.title,
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                controller.subtitle,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 8,
                                    wordSpacing: 4),
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                      flex: 3,
                      // margin: EdgeInsets.only(top: constraint.maxHeight * 0.1),
                      child: Text(
                        controller.text,
                        style: TextStyle(
                          height: 2,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  bottomContainer(BoxConstraints constraint) => Row(
        children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controllerPlan.title,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    height: constraint.maxHeight * 0.1,
                    child: Row(
                      children: controllerPlan.plans
                          .map<Widget>((e) => PlanWidget(
                              plan: e, constraint: constraint, mobile: false))
                          .toList(),
                    ),
                  )
                ],
              )),
        ],
      );
}
