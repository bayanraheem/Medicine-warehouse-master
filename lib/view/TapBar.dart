//import 'dart:ffi';
import 'package:apothecary/view/Vaccines.dart';
import 'package:apothecary/view/Drawer.dart';
import 'package:apothecary/view/HomePage.dart';
import 'package:apothecary/view/Sterilizers.dart';
import 'package:apothecary/view/Intravenous_infusion_solution.dart';
import 'package:apothecary/view/Oral_medication.dart';
import 'package:apothecary/view/search.dart';
import 'package:apothecary/view/Injectable_medications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTapBar extends StatelessWidget {
  const MyTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    MyTapBar1 tabs = Get.put(MyTapBar1());
    return Scaffold(
      drawer: Drawerapp(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Padding(
          padding: EdgeInsets.only(left: 55, top: 8),
          child: Center(
            child: Image.asset(
              "assets/image/photo1700768808-removebg-preview.png",
              height: 100,
              width: 100,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: search());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_sharp,
                color: Colors.white,
              )),
        ],
        bottom: TabBar(
          controller: tabs.controller,
          isScrollable: true,
          tabs: tabs.myTabs,
        ),
      ),
      body: TabBarView(
        controller: tabs.controller,
        //استدعاء لفتح كل صفحة من tapBar
        children: const [
          HomePage(),
          Oral_medication(),
          Injectable_medications(),
          Intravenous_infusion_solution(),
          Vaccines(),
          Sterilizers(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.telegram, color: Colors.greenAccent),
                    onPressed: () {},
                  ),
                  //تواصل
                  Text(
                    "15".tr,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40.0, top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.dashboard_rounded,
                        color: Colors.greenAccent),
                    onPressed: () {},
                  ),
                  //الطلبات
                  Text(
                    "16".tr,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0, top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.greenAccent),
                    onPressed: () {},
                  ),
                  //السلة
                  Text(
                    "17".tr,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.greenAccent),
                    onPressed: () {},
                  ),
                  //المفضلة
                  Text(
                    "18".tr,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(HomePage());
        },
        child: Icon(
          Icons.home,
          size: 40,
        ),
        foregroundColor: Colors.greenAccent,
      ),
    );
  }
}

// ignore: deprecated_member_use
class MyTapBar1 extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;
  late ScrollController scrollController;

  @override
  void onInit() {
    controller = TabController(length: 6, vsync: this);
    scrollController = ScrollController();
    // super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    scrollController.dispose();
    super.onClose();
  }

  get myTabs => <Tab>[
        //"الواجهة الرئسية"
        Tab(
          text: "14".tr,
        ),
        //الادوية الفموية
        Tab(
          text: "9".tr,
        ),
        //الادوية عن طريق الحقن
        Tab(
          text: "10".tr,
        ),
        //محاليل التسريب الوريدي
        Tab(
          text: "11".tr,
        ),
        //اللقاحات
        Tab(
          text: "12".tr,
        ),
        //المعقمات
        Tab(
          text: "13".tr,
        ),
      ];
}
