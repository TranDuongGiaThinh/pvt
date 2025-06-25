import 'package:flutter/material.dart';
import '../../global_datas/global_data.dart';
import '../../utils/constants.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width < 450
            ? null
            : MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        color: Constants.backgroundHeader,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Constants.websiteName,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildNavItem(Constants.homeTitle), 
                  buildNavItem(Constants.introductionTitle),
                  buildNavItem(Constants.contactTitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          GlobalData.homePresenter.setMenu(title);
          setState(() {});
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (states) => GlobalData.homePresenter.selectedMenu == title
                ? Constants.backgroundHeader
                : Colors.transparent,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: GlobalData.homePresenter.selectedMenu == title
                ? Colors.white
                : Colors.white70,
            fontWeight: GlobalData.homePresenter.selectedMenu == title
                ? FontWeight.bold
                : FontWeight.normal,
            decoration: GlobalData.homePresenter.selectedMenu == title
                ? TextDecoration.underline
                : null,
            decorationColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
