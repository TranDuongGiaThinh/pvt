import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../global_datas/global_data.dart';
import '../../models/product_model.dart';
import '../../utils/constants.dart';
import 'package:universal_html/html.dart' as html;

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.imagePath != null
                    ? product.imagePath!
                    : Constants.defaultProductImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Giá bán: ${currencyFormat.format(product.price)}đ',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: 'zalo_btn',
              onPressed: () {
                // mở link zalo
                html.window.open(GlobalData.setting.zalo, '_blank');
              },
              label: const Text('Zalo'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            const SizedBox(height: 8.0),
            FloatingActionButton.extended(
              heroTag: 'facebook_btn',
              onPressed: () {
                // mở link facebook
                html.window.open(GlobalData.setting.facebook, '_blank');
              },
              label: const Text('Facebook'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
