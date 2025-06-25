/* Thông Tin Các API */

class ApiConfig {
  static const String serverIP = 'http://localhost';
  static const String serverPort = '3006';
  // static const String serverDomain = 'http://giree.abc';

  // Chọn base URL theo IP hoặc Domain
  static const String baseUrl = '$serverIP:$serverPort'; // Hoặc thay bằng serverDomain

  // Các Endpoint
  static String getWebsiteIdAPI = '$baseUrl/website/check-domain-exists'; // tên miền truyền vào body qua thuộc tính 'domain'
  static String getSettingAPI = '$baseUrl/setting/get/'; // /setting/get/:website_id
  static String getAllProductTypesAPI = '$baseUrl/product-type/get-all/'; // /product-type/get-all/:website_id
  static String getAllProductsAPI = '$baseUrl/product/get-all/'; // /product/get-all/:website_id
}