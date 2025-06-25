class ProductTypeModel {
  int id;
  String type;

  ProductTypeModel({required this.id, required this.type});

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) {
    return ProductTypeModel(id: json['id'], type: json['type']);
  }
}
