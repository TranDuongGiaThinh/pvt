import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pvt/presenters/suggestion_presenter.dart';
import '../../models/product_model.dart';
import '../global_datas/global_data.dart';

class ProductListPresenter {
  ProductListPresenter({required this.products}) {
    isShowColumn = products.length < 6;
  }

  final LayerLink layerLink = LayerLink();
  OverlayEntry? overlayEntry;
  TextEditingController searchController = TextEditingController();

  List<ProductModel> products = [];
  List<String> searchSuggestions = [];

  bool isTyping = false;
  bool isShowColumn = false;

  bool isPriceUp = false;
  int? selectedProductTypeId;

  // Hàm reload giao diện mặc định (dùng để debug)
  Function reload = () {
    if (kDebugMode) {
      print('Hàm cập nhập giao diện trang web chưa được khởi tạo!');
    }
  };

  // Hàm tạo danh sách gợi ý dựa trên tất cả sản phẩm
  getSuggestions() async {
    List<String> nameStrings =
        GlobalData.allProducts.map((product) {
          return product.name;
        }).toList();
    List<String> descriptionStrings =
        GlobalData.allProducts.map((product) {
          return product.description;
        }).toList();

    List<String> nameSuggestions = await createSuggestion(
      nameStrings,
      searchController.text,
    );
    List<String> descriptionSuggestions = await createSuggestion(
      descriptionStrings,
      searchController.text,
    );

    searchSuggestions =
        [
          ...{...nameSuggestions, ...descriptionSuggestions},
        ].take(10).toList();

    reload();
  }

  // Hàm hiển thị danh sách gợi ý
  void showSuggestions(BuildContext context) {
    GlobalData.productListPresenter.hideSuggestions();

    GlobalData.productListPresenter.overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            width: MediaQuery.of(context).size.width - 50 - 16,
            child: CompositedTransformFollower(
              link: layerLink,
              offset: const Offset(8.0, 50),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8.0),
                child:
                    GlobalData.productListPresenter.searchSuggestions.isEmpty
                        ? const SizedBox()
                        : Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                              GlobalData.productListPresenter.searchSuggestions
                                  .map((suggestion) {
                                    return ListTile(
                                      title: Text(suggestion),
                                      onTap: () {
                                        GlobalData
                                            .productListPresenter
                                            .searchController
                                            .text = suggestion;
                                        GlobalData.productListPresenter
                                            .search();
                                        GlobalData.productListPresenter
                                            .hideSuggestions();
                                      },
                                    );
                                  })
                                  .toList(),
                        ),
              ),
            ),
          ),
    );

    Overlay.of(context).insert(GlobalData.productListPresenter.overlayEntry!);
    GlobalData.productListPresenter.isTyping = true;
  }

  // Hàm ẩn danh sách gợi ý
  void hideSuggestions() {
    if (GlobalData.productListPresenter.isTyping) {
      overlayEntry?.remove();
      overlayEntry = null;
      GlobalData.productListPresenter.isTyping =
          GlobalData.productListPresenter.searchController.text.isNotEmpty;
    }
  }

  // Hàm tìm kiếm danh sách sản phẩm theo từ khóa
  search() async {
    if (searchController.text.isEmpty) {
      products = GlobalData.allProducts;
    } else {
      List<ProductModel> searchByNameProducts =
          GlobalData.allProducts.where((product) {
            return product.name.toLowerCase().contains(
              searchController.text.toLowerCase(),
            );
          }).toList();

      List<ProductModel> searchByDescriptionProducts =
          GlobalData.allProducts.where((product) {
            return product.description.toLowerCase().contains(
              searchController.text.toLowerCase(),
            );
          }).toList();

      products =
          [
            ...{...searchByNameProducts, ...searchByDescriptionProducts},
          ].toList();
    }
    reload();
  }

  // Hàm lọc sản phẩm theo loại sản phẩm
  filter(int? id) async {
    selectedProductTypeId = id;

    // Nếu không có loại sản phẩm nào được chọn, hiển thị tất cả sản phẩm
    if (selectedProductTypeId == null) {
      products = GlobalData.allProducts;
    } else {
      // Lọc các sản phẩm theo loại sản phẩm
      products =
          GlobalData.allProducts.where((product) {
            return selectedProductTypeId! == product.typeId;
          }).toList();
    }

    reload();
  }

  // Hàm sắp xếp sản phẩm theo giá sản phẩm
  sortByPrice() async {
    products =
        products..sort(
          (a, b) =>
              isPriceUp
                  ? a.price.compareTo(b.price)
                  : b.price.compareTo(a.price),
        );

    reload();
  }
}
