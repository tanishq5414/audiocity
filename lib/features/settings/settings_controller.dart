import 'package:get/get.dart';
import 'package:psventuresassignment/common/snack_bar.dart';
import 'package:psventuresassignment/constants/interaction_messages.dart';
import 'package:psventuresassignment/core/repository/storage_repository.dart';

class SettingsController extends GetxController {
  StorageRepository storageRepository = StorageRepository();
  var currentPath = '';
  bool askForFileNames = false;
  
  @override
  onInit() async {
    super.onInit();
    currentPath = await storageRepository.getPath();
    askForFileNames = await storageRepository.checkFileNames();
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
    showCommonSnackBar(context, "File names will be ${askForFileNames ? 'asked' : 'not asked'}");
    update();
  }
}
