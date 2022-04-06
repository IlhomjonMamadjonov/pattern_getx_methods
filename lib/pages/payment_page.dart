import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/home_controller.dart';
import 'package:pattern_getx/controllers/main_controller.dart';
import 'package:pattern_getx/controllers/payment_controller.dart';
import 'package:pattern_getx/views/item_of_post_main_controller.dart';
import 'package:pattern_getx/views/item_payment_post.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);
  static final String id = "/payment_page";

  @override
  State<PaymentPage> createState() => _HomePageState();
}

class _HomePageState extends State<PaymentPage> {
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
      body: GetBuilder<PaymentController>(
          init: PaymentController(),
          builder: (_controller) {
            return Stack(
              children: [
                ListView.builder(
                    itemCount:_controller.items.length,
                    itemBuilder: (ctx, index) {
                      return itemOfPaymentController(_controller,
                          _controller.items[index]);
                    }),
                _controller.isLoading
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
