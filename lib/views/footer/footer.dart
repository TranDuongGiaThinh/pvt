import 'package:flutter/material.dart';
import '../../global_datas/global_data.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: HtmlWidget(GlobalData.setting.footerHtml),
    );
  }
}
