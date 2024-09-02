import 'package:get/get.dart';
import 'package:psventuresassignment/features/list_audio/list_recordings_controller.dart';

class ListRecordingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListRecordingsController>(() => ListRecordingsController());
  }
}