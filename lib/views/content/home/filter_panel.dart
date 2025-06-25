import 'package:flutter/material.dart';

import '../../../global_datas/global_data.dart';
import '../../../utils/constants.dart';
import 'product_type_dropdown.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({super.key});

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  @override
  Widget build(BuildContext context) {
    // chiều rộng màn hình
    double widthScreen = MediaQuery.of(context).size.width;

    // nếu màn hình lớn, hiện cùng một hàng
    if (widthScreen > 490) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Số lượng sản phẩm
          buildProductCounts(),

          // các tùy chọn lọc / sắp xếp
          buildFilterPanel(),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Số lượng sản phẩm
          buildProductCounts(),

          // các tùy chọn lọc / sắp xếp
          buildFilterPanel(),
        ],
      );
    }
  }

  // số lượng sản phẩm
  buildProductCounts() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        '${Constants.productCountTitle}${GlobalData.productListPresenter.products.length}',
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color: Constants.textColor,
        ),
      ),
    );
  }

  // các tùy chọn lọc / sắp xếp
  buildFilterPanel() {
    // chiều rộng màn hình
    double widthScreen = MediaQuery.of(context).size.width;

    // nếu màn hình lớn, hiện cùng một hàng
    if (widthScreen > 310) {
      return Row(
        children: [
          // nút lọc loại sản phẩm
          buildProductTypeFilter(),

          // sắp xếp giá tăng / giảm
          buildPriceSort(),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // nút lọc loại sản phẩm
          buildProductTypeFilter(),

          // sắp xếp giá tăng / giảm
          buildPriceSort(),
        ],
      );
    }
  }

  // nút lọc loại sản phẩm
  buildProductTypeFilter() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ProductTypeDropdown(),
    );
  }

  // nút sắp xếp theo giá
  buildPriceSort() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: GestureDetector(
        onTap: () {
          // Xử lý sắp xếp ở đây
          GlobalData.productListPresenter.isPriceUp = !GlobalData.productListPresenter.isPriceUp;
          GlobalData.productListPresenter.sortByPrice();
        },
        child: DropdownButton<String>(
          value: Constants.priceTitle,
          onChanged: null, // Không xử lý sắp xếp ở đây
          items:
              [Constants.priceTitle].map<DropdownMenuItem<String>>((
                String item,
              ) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(color: Constants.textColor),
                  ),
                );
              }).toList(),
          icon: Icon(
            GlobalData.productListPresenter.isPriceUp
                ? Constants.priceUpIcon
                : Constants.priceDownIcon,
            color: Constants.iconColor,
          ),
        ),
      ),
    );
  }
}
