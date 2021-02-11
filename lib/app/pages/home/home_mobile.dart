import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:websitespa/app/pages/home/home_controller.dart';
import 'package:websitespa/app/pages/home/home_page_mobile.dart';
import 'package:websitespa/app/pages/plans/plans_page_mobile.dart';

class HomeMobile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String contentText;
  HomeMobile(
      {@required this.title,
      @required this.subtitle,
      @required this.contentText});
  final TextStyle style = TextStyle(
    color: Color(0xFFBECCAB),
    fontWeight: FontWeight.w900,
    letterSpacing: 2,
  );
  final controller = GetIt.I.get<HomeController>();
  final PageController controllerPage = PageController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          color: Color.fromRGBO(235, 235, 235, 1.0),
        )),
        Positioned.fill(
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/plant1.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ],
            )),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.scaleDown,
                  scale: 2,
                ),
              ),
              actions: [
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
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Flexible(
                      flex: 1,
                      child: ValueListenableBuilder(
                        valueListenable: controller.menu,
                        builder: (_, value, child) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: controller.menus.value
                              .map(
                                (e) => TextButton(
                                  onPressed: () {
                                    controller.changeMenu(e);
                                    controllerPage.animateToPage(
                                        controller.menus.value.indexOf(e),
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeIn);
                                  },
                                  child: Text(
                                    e.title,
                                    style: style.copyWith(
                                        color: controller.menu.value.title ==
                                                e.title
                                            ? Colors.black
                                            : null),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )),
                  Expanded(
                    flex: 9,
                    child: LayoutBuilder(
                      builder: (_, constraint) => PageView(
                        controller: controllerPage,
                        physics: PageScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          HomePageMobile(constraints: constraint),
                          PlansPageMobile(
                            constraints: constraint,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
