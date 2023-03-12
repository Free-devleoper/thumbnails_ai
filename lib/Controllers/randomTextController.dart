import 'package:get/get.dart';
import 'package:thumbnails_ai/data/repository/random_text_repo.dart';
import 'package:thumbnails_ai/models/postsmodel.dart';
class RandomTextController extends GetxController{
  final RandomTextRepo randomTextRepo;
  RandomTextController({required this.randomTextRepo});
  List<dynamic> _randomTextList=[];
  List <dynamic> get randomTextList => _randomTextList;
  bool _isLoaded=false;
  bool get isLoaded =>_isLoaded;
  Future<void> getRandomTextList()async{
   Response response= await randomTextRepo.getRandomText();
   if(response.statusCode==200){
     _isLoaded=true;
     _randomTextList=[];
     _randomTextList.addAll(response.body);
     update();
   }else{

   }
  }
}