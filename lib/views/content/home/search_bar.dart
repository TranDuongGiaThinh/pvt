import 'package:flutter/material.dart';

import 'product_show_type.dart';
import 'search_textfield.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ô tìm kiếm
          SearchTextfield(),
          // nút loại hiển thị danh sách sản phẩm
          ProductShowType(),
        ],
      ),
    );
  }
}
