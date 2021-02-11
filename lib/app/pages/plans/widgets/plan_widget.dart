import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websitespa/domain/entities/planspa.dart';

class PlanWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final bool mobile;
  final PlanSpa plan;
  PlanWidget(
      {@required this.constraint, this.mobile = false, @required this.plan});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: mobile
            ? EdgeInsets.symmetric(
                horizontal: constraint.maxWidth * 0.05,
                vertical: constraint.maxHeight * 0.025)
            : EdgeInsets.only(right: constraint.maxWidth * 0.03),
        height:
            mobile ? constraint.maxHeight * 0.2 : constraint.maxHeight * 0.1,
        width: mobile ? constraint.maxWidth * 0.7 : constraint.maxWidth * 0.2,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1), offset: Offset(4, 4))
            ],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: plan.image, fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: constraint.maxHeight * 0.01,
              horizontal: mobile
                  ? constraint.maxWidth * 0.05
                  : constraint.maxWidth * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plan.title,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'R\$${plan.price.toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                    color: plan.color,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  plan.slogan,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ));
  }
}
