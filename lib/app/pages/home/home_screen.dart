import 'package:flutter/material.dart';
import 'package:websitespa/app/pages/home/home_mobile.dart';

import 'home_desktop.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 850
        ? HomeMobile(
            title: 'NO CONFORTO \nDO SEU LAR',
            subtitle: 'VAMOS ATÉ VOCÊ!',
            contentText:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          )
        : HomeDesktop();
  }
}
