import '../models/product_type_model.dart';
import '../models/setting_model.dart';
import '../models/product_model.dart';
import '../presenters/product_list_presenter.dart';
import '../presenters/home_presenter.dart';
import '../utils/constants.dart';

class GlobalData {
  // Khởi tạo Presenter
  static HomePresenter homePresenter = HomePresenter();
  static ProductListPresenter productListPresenter = ProductListPresenter(
    products: [],
  );

  // Mã website
  static int websiteId = Constants.nonId;

  // Thông tin website
  static SettingModel setting = SettingModel.defaultSetting();

  // Danh sách loại sản phẩm
  static List<ProductTypeModel> productTypes = [];

  // Danh sách tất cả sản phẩm
  static List<ProductModel> allProducts = [];
}
