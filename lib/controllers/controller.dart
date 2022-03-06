import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:getx_apicall/modal/data_modal.dart';

class Controller extends GetxController {
  var dataList = <ApiDataModal>[].obs;
  var isLoading = true.obs;
  var url = 'https://jsonplaceholder.typicode.com/posts/2';

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      ApiDataModal _apiDataModal =
          ApiDataModal.fromJson(jsonDecode(response.body));

      dataList.add(
        ApiDataModal(
          userId: _apiDataModal.userId,
          id: _apiDataModal.id,
          title: _apiDataModal.title,
          body: _apiDataModal.body,
        ),
      );
      isLoading.value = false;
      update();
    } else {
      Get.snackbar(
        'Error Loading Data',
        'Server Responded: ${response.statusCode} : ${response.reasonPhrase.toString()}',
      );
    }
  }
}
