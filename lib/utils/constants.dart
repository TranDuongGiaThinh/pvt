import 'package:flutter/material.dart';

class Constants {
  // Ảnh
  static String defaultProductImage =
      'assets/default_images/default_product_image.png';

  // Số
  static int nonId = -1; // id mặc định, không hợp lệ
  static String zaloDefault = 'https://zalo.me/0962583120';
  static String facebookDefault = 'https://www.facebook.com/profile.php?id=61573445841359';

  // Chuỗi
  static String websiteName = 'Giree'; // tên website
  static String defaultPage = homeTitle; // trang mặc định

  // tiêu đề từng trang
  static String homeTitle = 'Trang chủ';
  static String introductionTitle = 'Giới thiệu';
  static String contactTitle = 'Liên hệ';

  static String searchTitle = 'Tìm kiếm...'; // chữ gợi ý nhập liệu để tìm kiếm
  static String productCountTitle =
      'Số lượng sản phẩm: '; // tiêu đề hiển thị số lượng sản phẩm
  static String chooseProductTypeTitle =
      'Chọn sản phẩm'; // tiêu đề yêu cầu chọn loại sản phẩm để lọc
  static String priceTitle =
      'Giá'; // tiêu đề trong nút sắp xếp theo giá (Giá + icon tăng/giảm)

  // Màu sắc
  static Color textColor = Colors.black87;
  static Color mainColor = Colors.blue; // màu chủ đạo
  static Color backgroundHeader = Colors.blue; // màu nền header
  static Color backgroundfooter = Colors.grey; // màu nền footer
  static Color iconColor = Colors.black54; // màu các icon

  // Icons
  static IconData showColumnIcon =
      Icons.table_rows_rounded; // biểu tượng hiện sản phẩm dạng cột
  static IconData showGirdIcon =
      Icons.grid_view_rounded; // biểu tượng hiện sản phẩm dạng lưới
  static IconData priceUpIcon =
      Icons.arrow_upward_rounded; // biểu tượng sắp xếp theo giá tăng
  static IconData priceDownIcon =
      Icons.arrow_downward_rounded; // biểu tượng sắp xếp theo giá giảm

  // HTML mặc định
  static String footerHtmlDefault =
      '''<footer style="background-color: #f8f9fa; padding: 20px 0; text-align: center; border-top: 1px solid #e7e7e7;">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>Liên hệ</h5>
                <p>Email: support@banhang.com</p>
                <p>Điện thoại: 0123 456 789</p>
                <p>Địa chỉ: 123 Đường ABC, Quận XYZ, TP.HCM</p>
            </div>
            <div class="col-md-4">
                <h5>Liên kết nhanh</h5>
                <ul style="list-style-type: none; padding: 0;">
                    <li><a href="#" style="text-decoration: none; color: #007bff;">Trang chủ</a></li>
                    <li><a href="#" style="text-decoration: none; color: #007bff;">Sản phẩm</a></li>
                    <li><a href="#" style="text-decoration: none; color: #007bff;">Giới thiệu</a></li>
                    <li><a href="#" style="text-decoration: none; color: #007bff;">Liên hệ</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Theo dõi chúng tôi</h5>
                <a href="#" style="margin: 0 10px;"><img src="https://img.icons8.com/color/48/000000/facebook-new.png" alt="Facebook" style="width: 32px; height: 32px;"></a>
                <a href="#" style="margin: 0 10px;"><img src="https://img.icons8.com/color/48/000000/twitter--v1.png" alt="Twitter" style="width: 32px; height: 32px;"></a>
                <a href="#" style="margin: 0 10px;"><img src="https://img.icons8.com/color/48/000000/instagram-new.png" alt="Instagram" style="width: 32px; height: 32px;"></a>
            </div>
        </div>
    </div>
    <div style="margin-top: 20px;">
        <p>&copy; 2023 Bản quyền thuộc về Công ty Bán Hàng. Mọi quyền được bảo lưu.</p>
    </div>
</footer>''';

  static String introductionHtmlDefault =
      '''<div style="padding: 20px; font-family: Arial, sans-serif;">
      <h1 style="text-align: center; color: #333;">Giới thiệu về chúng tôi</h1>
      <p style="text-align: justify; line-height: 1.6;">
          Chúng tôi là một công ty chuyên cung cấp các sản phẩm chất lượng cao với sứ mệnh mang đến trải nghiệm mua sắm tuyệt vời nhất cho khách hàng. Với đội ngũ nhân viên giàu kinh nghiệm và đam mê, chúng tôi luôn nỗ lực để cải thiện và phát triển không ngừng.
      </p>
      <h2 style="color: #007bff;">Sứ mệnh</h2>
      <p style="text-align: justify; line-height: 1.6;">
          Sứ mệnh của chúng tôi là cung cấp những sản phẩm và dịch vụ tốt nhất, đáp ứng mọi nhu cầu của khách hàng, đồng thời góp phần xây dựng một cộng đồng mua sắm bền vững.
      </p>
      <h2 style="color: #007bff;">Tầm nhìn</h2>
      <p style="text-align: justify; line-height: 1.6;">
          Chúng tôi hướng tới trở thành một trong những thương hiệu hàng đầu trong lĩnh vực bán lẻ, không chỉ tại Việt Nam mà còn trên toàn thế giới.
      </p>
  </div>''';

  static String contactHtmlDefault =
      '''<div style="padding: 20px; font-family: Arial, sans-serif;">
      <h1 style="text-align: center; color: #333;">Liên hệ với chúng tôi</h1>
      <p style="text-align: center; line-height: 1.6;">
          Chúng tôi luôn sẵn lòng lắng nghe và hỗ trợ bạn. Hãy liên hệ với chúng tôi qua thông tin dưới đây hoặc điền vào biểu mẫu bên dưới.
      </p>
      <div style="display: flex; justify-content: space-around; margin-top: 30px;">
          <div>
              <h2 style="color: #007bff;">Thông tin liên hệ</h2>
              <p><strong>Email:</strong> support@banhang.com</p>
              <p><strong>Điện thoại:</strong> 0123 456 789</p>
              <p><strong>Địa chỉ:</strong> 123 Đường ABC, Quận XYZ, TP.HCM</p>
          </div>
      </div>
  </div>''';
}
