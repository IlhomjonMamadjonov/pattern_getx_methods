import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/home_controller.dart';
import 'package:pattern_getx/views/item_of_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "/home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _controller.apiPostList();
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
                  itemCount: _controller.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(_controller, _controller.items[index]);
                  }),
              _controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ));
  }
}
