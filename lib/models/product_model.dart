import '../global_datas/global_data.dart';

class ProductModel {
  int id;
  String? imagePath;
  int typeId;
  String type = 'Không xác định!';
  String name;
  String description;
  int price;

  ProductModel({
    required this.id,
    required this.imagePath,
    required this.typeId,
    required this.name,
    required this.description,
    required this.price,
  }) {
    try {
      type = GlobalData.productTypes.firstWhere((element) => element.id == typeId).type;
    } catch (e) {
      // không cần xử lý vì kiểu đã được gán mặc định
    }
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      imagePath:
          (json['image_path'] != null &&
                  json['image_path'].toString().trim().isNotEmpty)
              ? json['image_path']
              : null,
      typeId: json['product_type_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}
