import 'package:get/get.dart';
import 'package:sharethechurch/utils/keys/keys.dart';
import 'package:sharethechurch/utils/widgets/dialogs/loading_dialog.dart';

showLoadingDialog() =>
    Get.dialog(const LoadingDialog(), barrierDismissible: false);

showErrorSnackbar(String message) => Get.snackbar(KEY_ERROR_OCCURED, message);

showMessageDialog(String message) => Get.snackbar(KEY_NOTIFICATION, message);
