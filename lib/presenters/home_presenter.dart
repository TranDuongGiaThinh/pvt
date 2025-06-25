import 'package:flutter/foundation.dart';
import 'package:pvt/presenters/product_list_presenter.dart';
import 'package:universal_html/html.dart' as html;
import '../api_services/api_service.dart';
import '../global_datas/global_data.dart';
import '../utils/constants.dart';

class HomePresenter {
  String selectedMenu = Constants.defaultPage;

  bool isLoading = false;

  Function reload = () {
    if (kDebugMode) {
      print('Hàm cập nhập giao diện trang web chưa được khởi tạo!');
    }
  };

  /// Hàm load dữ liệu từ API
  Future<void> loadData() async {
    isLoading = true;
    reload();

    try {
      final ApiService apiService = ApiService();

      // Lấy url hiện tại của trang web
      String domain =
          html
              .window
              .location
              .href; // chỉ có tác dụng khi triển khai, không có tác dụng ở localhost

      // Lấy websiteID bằng tên domain
      GlobalData.websiteId = await apiService.fetchWebsiteId(domain);

      if (GlobalData.websiteId == Constants.nonId) {
        isLoading = false;
        reload();
        return;
      }

      GlobalData.setting = await apiService.fetchSetting(GlobalData.websiteId);
      GlobalData.productTypes = await apiService.fetchProductTypes(
        GlobalData.websiteId,
      );
      GlobalData.allProducts = await apiService.fetchProducts(
        GlobalData.websiteId,
      );
      GlobalData.productListPresenter = ProductListPresenter(
        products: GlobalData.allProducts,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi khi tải dữ liệu: $e');
      }
    }

    isLoading = false;
    reload();
  }

  // Phương thức để cập nhật trạng thái
  void setMenu(String menu) {
    selectedMenu = menu;
    reload();
  }

  // Phương thức lấy trạng thái hiện tại
  String getMenu() {
    return selectedMenu;
  }
}
