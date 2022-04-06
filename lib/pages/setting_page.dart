import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/main_controller.dart';
import 'package:pattern_getx/controllers/setting_controller.dart';
import 'package:pattern_getx/views/item_setting_post.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static final String id = "/setting_page";

  @override
  State<SettingPage> createState() => _HomePageState();
}

class _HomePageState extends State<SettingPage> {
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
      body: GetX<SettingController>(
          init: SettingController(),
          builder: (_controller) {
            return Stack(
              children: [
                ListView.builder(
                    itemCount:_controller.items.length,
                    itemBuilder: (ctx, index) {
                      return itemOfSettingController(_controller,
                          _controller.items[index]);
                    }),
                _controller.isLoading.value
                    ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
                    : SizedBox.shrink()
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
