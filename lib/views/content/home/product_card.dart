import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../global_datas/global_data.dart';
import '../../../models/product_model.dart';
import '../../../utils/constants.dart';
import '../../product_detail/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.height,
    required this.width,
  });

  final ProductModel product;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '',
      decimalDigits: 0,
    );

    return GestureDetector(
      onTap: () {
        GlobalData.productListPresenter.hideSuggestions();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            product.imagePath != null
                                ? product.imagePath!
                                : Constants.defaultProductImage,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        product.type,
                        style: const TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      '${currencyFormat.format(product.price)}đ',
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
