import 'package:flutter/material.dart';

import '../../../global_datas/global_data.dart';
import '../../../utils/constants.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({super.key});

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: GlobalData.productListPresenter.layerLink,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width - 50,
        child: TextField(
          controller: GlobalData.productListPresenter.searchController,
          decoration: InputDecoration(
            hintText: Constants.searchTitle,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search, color: Constants.iconColor),
            suffixIcon:
                !GlobalData.productListPresenter.isTyping
                    ? null
                    : IconButton(
                      icon: Icon(Icons.clear, color: Constants.iconColor),
                      onPressed: () {
                        setState(() {
                          GlobalData.productListPresenter.searchController.clear();
                        });
                        GlobalData.productListPresenter.search();
                        GlobalData.productListPresenter.hideSuggestions();
                      },
                    ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          onTap: () {
            GlobalData.productListPresenter.getSuggestions().then((value) {
              GlobalData.productListPresenter.showSuggestions(context);
            });
            setState(() {});
          },
          onChanged: (text) {
            setState(() {});
            GlobalData.productListPresenter.getSuggestions().then((value) {
              if (GlobalData.productListPresenter.searchSuggestions.isNotEmpty) {
                GlobalData.productListPresenter.showSuggestions(context);
              } else {
                GlobalData.productListPresenter.hideSuggestions();
              }
            });
          },
        ),
      ),
    );
  }
}
