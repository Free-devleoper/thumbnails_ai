import 'package:get/get.dart';
import 'package:thumbnails_ai/data/api/api_client.dart';
import 'package:thumbnails_ai/utils/app_constants.dart';

class RandomTextRepo extends GetxService{
  final ApiClient apiClient;
  RandomTextRepo({required this.apiClient});

  Future<Response> getRandomText() async{
    return await apiClient.getData(AppConstants.RANDOM_TEXT_URL);
  }
}