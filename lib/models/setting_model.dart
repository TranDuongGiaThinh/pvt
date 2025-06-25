import '../utils/constants.dart';

class SettingModel {
  int websiteId;
  String websiteName;
  String footerHtml;
  String zalo;
  String facebook;
  String introductionHtml;
  String contactHtml;

  SettingModel({
    required this.websiteId,
    required this.websiteName,
    required this.zalo,
    required this.facebook,
    required this.footerHtml,
    required this.introductionHtml,
    required this.contactHtml,
  });

  factory SettingModel.defaultSetting() {
    return SettingModel(
      websiteId: Constants.nonId,
      websiteName: Constants.websiteName,
      zalo: Constants.zaloDefault,
      facebook: Constants.facebookDefault,
      footerHtml: Constants.footerHtmlDefault,
      introductionHtml: Constants.introductionHtmlDefault,
      contactHtml: Constants.contactHtmlDefault,
    );
  }

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(
      websiteId: json['website_id'],
      websiteName: json['website_name'],
      zalo: json['zalo'],
      facebook: json['facebook'],
      footerHtml: json['footer_html'],
      introductionHtml: json['introduction_html'],
      contactHtml: json['contact_html'],
    );
  }
}
