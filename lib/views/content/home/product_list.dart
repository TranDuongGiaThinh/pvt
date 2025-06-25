import 'package:flutter/material.dart';
import '../../../global_datas/global_data.dart';
import '../../footer/footer.dart';
import 'filter_panel.dart';
import 'product_card.dart';
import 'search_bar.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();

    GlobalData.productListPresenter.reload = () {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey.shade200,
        child: ListView(
          children: [
            SearchBarWidget(),
            FilterPanel(),
            LayoutBuilder(
              builder: (context, constraints) {
                double itemWidth =
                    GlobalData.productListPresenter.isShowColumn ||
                            GlobalData.productListPresenter.products.length == 1
                        ? constraints.maxWidth < 600
                            ? constraints.maxWidth * 0.76
                            : constraints.maxWidth * 0.6
                        : constraints.maxWidth < 600
                        ? constraints.maxWidth < 240
                            ? 150
                            : 180
                        : (constraints.maxWidth - 20) / 3;
                double itemHeight =
                    constraints.maxWidth < 900
                        ? constraints.maxWidth < 600
                            ? itemWidth * 1.3
                            : itemWidth * 1.2
                        : itemWidth * 1.1;

                int crossAxisCount =
                    GlobalData.productListPresenter.isShowColumn
                        ? 1
                        : (constraints.maxWidth / itemWidth).floor();

                List<Row> rows = [];
                for (
                  int i = 0;
                  i < GlobalData.productListPresenter.products.length;
                  i += crossAxisCount
                ) {
                  List<Widget> rowChildren = [];
                  for (int j = 0; j < crossAxisCount; j++) {
                    if (i + j < GlobalData.productListPresenter.products.length) {
                      rowChildren.add(
                        SizedBox(
                          width: itemWidth - 16.0,
                          height: itemHeight,
                          child: ProductCard(
                            product: GlobalData.productListPresenter.products[i + j],
                            height: itemHeight,
                            width: itemWidth,
                          ),
                        ),
                      );
                    }
                  }
                  rows.add(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: rowChildren,
                    ),
                  );
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: rows,
                    ),
                  ),
                );
              },
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
