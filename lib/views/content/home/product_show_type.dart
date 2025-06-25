import 'package:flutter/material.dart';

import '../../../global_datas/global_data.dart';
import '../../../utils/constants.dart';

class ProductShowType extends StatefulWidget {
  const ProductShowType({super.key});

  @override
  State<ProductShowType> createState() => _ProductShowTypeState();
}

class _ProductShowTypeState extends State<ProductShowType> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        GlobalData.productListPresenter.isShowColumn = !GlobalData.productListPresenter.isShowColumn;
        GlobalData.productListPresenter.reload();
      },
      icon: Icon(
        GlobalData.productListPresenter.isShowColumn
            ? Constants.showColumnIcon
            : Constants.showGirdIcon,
        color: Constants.iconColor,
      ),
    );
  }
}
