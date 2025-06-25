import 'package:flutter/material.dart';

import '../../../global_datas/global_data.dart';
import '../../../models/product_type_model.dart';
import '../../../utils/constants.dart';

class ProductTypeDropdown extends StatelessWidget {
  const ProductTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    // Thêm tùy chọn mặc định vào danh sách
    final List<ProductTypeModel> dropdownItems = [
      ProductTypeModel(
        id: Constants.nonId,
        type: Constants.chooseProductTypeTitle,
      ),
      ...GlobalData.productTypes,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DropdownButton<int>(
        value:
            GlobalData.productListPresenter.selectedProductTypeId ??
            dropdownItems.first.id,
        onChanged: (int? id) {
          if (id == null || id == Constants.nonId) id = null;
          GlobalData.productListPresenter.filter(id);
        },
        items:
            dropdownItems.map<DropdownMenuItem<int>>((ProductTypeModel item) {
              return DropdownMenuItem<int>(
                value: item.id,
                child: Text(
                  item.type,
                  style: TextStyle(color: Constants.textColor),
                ),
              );
            }).toList(),
      ),
    );
  }
}
