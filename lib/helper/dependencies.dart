import 'package:thumbnails_ai/Controllers/randomTextController.dart';
import 'package:thumbnails_ai/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:thumbnails_ai/utils/app_constants.dart';
import 'package:thumbnails_ai/data/repository/random_text_repo.dart';
Future<void> init()async {
  //Api Client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));


  //Repos
  Get.lazyPut(() => RandomTextRepo(apiClient: Get.find()));
// Controllers
  Get.lazyPut(() => RandomTextController(randomTextRepo: Get.find()));
}