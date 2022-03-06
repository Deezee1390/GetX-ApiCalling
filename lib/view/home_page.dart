import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_apicall/controllers/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<Controller>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Api'),
      ),
      body: Obx(
        () => _controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('userId: ${_controller.dataList[0].userId}'),
                      Text('id: ${_controller.dataList[0].id}'),
                      Text('title: ${_controller.dataList[0].title}'),
                      Text('body: ${_controller.dataList[0].body}'),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
