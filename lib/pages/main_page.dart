import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/home_controller.dart';
import 'package:pattern_getx/controllers/main_controller.dart';
import 'package:pattern_getx/views/item_of_post_main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static final String id = "/main_page";

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    Get.find<MainController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pattern - GetX"),
        ),
        body: Obx(
              () => Stack(
            children: [
              ListView.builder(
                  itemCount: Get.find<MainController>().items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPostController(Get.find<MainController>(), Get.find<MainController>().items[index]);
                  }),
              Get.find<MainController>().isLoading.value
                  ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
                  : SizedBox.shrink()
            ],
          ),
        ));
  }
}
