import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../global_datas/global_data.dart';
import '../utils/constants.dart';
import 'header/header.dart';
import 'content/contact/contact.dart';
import 'content/introduction/introduction.dart';
import 'content/home/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    GlobalData.homePresenter.reload = () {
      setState(() {
        if (kDebugMode) {
          print(
            'Cập nhật trạng thái thành công, ${GlobalData.allProducts.length} sản phẩm',
          );
        }
      });
    };

    // Load tất cả dữ liệu của trang web này từ server
    GlobalData.homePresenter.loadData();
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 450;

    return Scaffold(
      appBar:
          !isSmallScreen
              ? null
              : AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Constants.backgroundHeader,
                title: Text(
                  Constants.websiteName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
      drawer:
          !isSmallScreen
              ? null
              : Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        GlobalData.homePresenter.selectedMenu,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    if (GlobalData.homePresenter.selectedMenu !=
                        Constants.homeTitle)
                      ListTile(
                        title: Text(
                          Constants.homeTitle,
                          style: TextStyle(color: Constants.textColor),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          GlobalData.homePresenter.setMenu(Constants.homeTitle);
                        },
                      ),
                    if (GlobalData.homePresenter.selectedMenu !=
                        Constants.introductionTitle)
                      ListTile(
                        title: Text(
                          Constants.introductionTitle,
                          style: TextStyle(color: Constants.textColor),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          GlobalData.homePresenter.setMenu(
                            Constants.introductionTitle,
                          );
                        },
                      ),
                    if (GlobalData.homePresenter.selectedMenu !=
                        Constants.contactTitle)
                      ListTile(
                        title: Text(
                          Constants.contactTitle,
                          style: TextStyle(color: Constants.textColor),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          GlobalData.homePresenter.setMenu(
                            Constants.contactTitle,
                          );
                        },
                      ),
                  ],
                ),
              ),
      body:
          GlobalData.homePresenter.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  if (MediaQuery.of(context).size.height > 50 && !isSmallScreen)
                    const Header(),
                  buildContent(),
                ],
              ),
    );
  }

  Widget buildContent() {
    if (GlobalData.homePresenter.selectedMenu == Constants.homeTitle) {
      return const ProductList();
    }
    if (GlobalData.homePresenter.selectedMenu == Constants.introductionTitle) {
      return const Introduction();
    }
    if (GlobalData.homePresenter.selectedMenu == Constants.contactTitle) {
      return const Contact();
    } else {
      return Expanded(
        child: Container(
          color: Colors.grey.shade200,
          child: const Center(
            child: Text(
              'Không tìm thấy nội dung được chọn!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    }
  }
}
