import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:websitespa/app/pages/plans/plans_controller.dart';
import 'package:websitespa/app/pages/plans/widgets/plan_widget.dart';

class PlansPageMobile extends StatelessWidget {
  final BoxConstraints constraints;
  PlansPageMobile({this.constraints});
  final controller = GetIt.I.get<PlansController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight,
      child: Column(children: [
        Spacer(
          flex: 1,
        ),
        Flexible(
          flex: 1,
          child: Text(
            controller.title,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ),
        Expanded(
            flex: 4,
            child: LayoutBuilder(
              builder: (_, constraint) => Column(
                  children: controller.plans
                      .map<Widget>((e) => PlanWidget(
                          plan: e, constraint: constraint, mobile: true))
                      .toList()),
            )),
        Spacer(
          flex: 1,
        )
      ]),
    );
  }
}
