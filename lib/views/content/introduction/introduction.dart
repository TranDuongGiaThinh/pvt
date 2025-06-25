import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../global_datas/global_data.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: HtmlWidget(GlobalData.setting.introductionHtml),
      ),
    );
  }
}
