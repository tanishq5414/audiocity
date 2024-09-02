import 'package:get/get.dart';
import 'package:psventuresassignment/common/input_widget.dart';
import 'package:psventuresassignment/common/snack_bar.dart';
import 'package:psventuresassignment/constants/interaction_messages.dart';
import 'package:psventuresassignment/core/repository/storage_repository.dart';

class SettingsController extends GetxController {
  StorageRepository storageRepository = StorageRepository();
  var currentPath = '';
  bool askForFileNames = false;
  int samplingRate = 44100;

  @override
  onInit() async {
    super.onInit();
    currentPath = await storageRepository.getPath();
    askForFileNames = await storageRepository.checkFileNames();
    samplingRate = await storageRepository.getSamplingRate();
    update();
  }

  void changeFolderPath(context) async {
    String? newPath = await storageRepository.selectNewFolder();
    if (newPath != null) {
      currentPath = newPath;
      update();
    } else {
      showCommonSnackBar(context, InteractionMessages.folderSelectionFailed);
    }
  }

  void toggleFileNames(context) async {
    askForFileNames = !askForFileNames;
    await storageRepository.storeFileNames(askForFileNames);
    showCommonSnackBar(context,
        "File names will be ${askForFileNames ? 'asked' : 'not asked'}");
    update();
  }

  void changeSamplingRate(context) async {
    inputWidgetDialog(context, (value) async {
      int newSamplingRate = int.tryParse(value) ?? 44100;
      if (newSamplingRate < 4000 || newSamplingRate > 150000) {
        newSamplingRate = 44100;
        showCommonSnackBar(
            context, "Invalid sampling rate. Setting to default value");
      }
      await _changeSamplingRate(context, newSamplingRate);
      samplingRate = newSamplingRate;
      update();
    }, "Enter new sampling rate", initialValue: samplingRate.toString());
    update();
  }

  Future<void> _changeSamplingRate(context, int value) async {
    await storageRepository.setSamplingRate(value);
    showCommonSnackBar(context, "Sampling rate changed to $value");
    update();
  }
}
