import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thumbnails_ai/Controllers/randomTextController.dart';
import 'package:thumbnails_ai/utils/dimensions.dart';
import 'package:thumbnails_ai/widgets/BigText.dart';
import 'package:thumbnails_ai/utils/app_constants.dart';
import 'package:thumbnails_ai/widgets/smallText.dart';
import 'package:cached_network_image/cached_network_image.dart';
class thumbnailHomePage extends StatefulWidget {
  const thumbnailHomePage({Key? key}) : super(key: key);

  @override
  State<thumbnailHomePage> createState() => _thumbnailHomePageState();
}

class _thumbnailHomePageState extends State<thumbnailHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeytwo = GlobalKey<FormState>();
   var imageFile;
   bool loading_stage=false;
   String text_phrase='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: BigText(text:AppConstants.APP_NAME,color: Colors.white,size: Dimensions.font26,),),
      body:loading_stage==true?Center(child: CircularProgressIndicator()):SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height15,
                ),
                 Container(
                   child: Row(
                     children: [
                       SizedBox(width: Dimensions.width10,),
                       BigText(text:"Best Youtube Thumbnail",
                         size: Dimensions.font26,color: Colors.black,)
                     ], //Childern
                   ),
                 ),
                  SizedBox(height: Dimensions.height20,),
          GetBuilder<RandomTextController>(builder:(randomText){
            return Container(
              child: Row(
                children: [
                  Flexible(child: 
                  Container(
                      padding:EdgeInsets.only(left: 12,right: 12),
                      child: SmallText(text: randomText.randomTextList.isEmpty?"lOADING":randomText.randomTextList[0]['title'], color: Colors.black54, size: Dimensions.font26,)))
                ],
              ),
            );
          }),
                  SizedBox(height: Dimensions.height20,),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width10,),
                      BigText(text: "Pick an Image",size: Dimensions.font20,fontWeight: FontWeight.bold,color: Colors.black,),
                    ],
                  ),
                ),
                //Image Picker
                Container(
                    child:Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton (
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                            onPressed: () {
                              _getFromGallery();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.upload_file_outlined),
                                SizedBox(width: Dimensions.width10,),
                                SmallText(text:"Upload From Gallery",size: Dimensions.font20,color: Colors.white,)
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style:ElevatedButton.styleFrom(backgroundColor:  Colors.blueAccent),
                            onPressed: () {
                              _getFromCamera();
                            },
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_enhance_outlined),
                                SizedBox(width: Dimensions.width10,),
                                SmallText(text:"Pick From Camera",size: Dimensions.font20,color: Colors.white,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),),
                Center(
                  child:imageFile==null ?SizedBox(height: Dimensions.height20,) :Container(
                    child: Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                      height: Dimensions.pageViewContainer,
                    ),
                  ),
                ),
                //
                SizedBox(height: Dimensions.height20,),
                // Center(
                //   child: CachedNetworkImage(
                //     height: Dimensions.pageViewContainer,
                //     imageUrl: "https://images.pexels.com/photos/6087668/pexels-photo-6087668.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=400&h=250&fit=crop&crop=focalpoint",
                //     placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                //     errorWidget: (context, url, error) => Icon(Icons.error),
                //   ),
                // ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width10,),
                      BigText(text: "Add your Topic Phrase",size: Dimensions.font20,fontWeight: FontWeight.bold,color: Colors.black,),
                    ],
                  ),
                ),
                SizedBox(height:Dimensions.height20,),
                Container(
                  child: Form(
                    key: _formKey,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Dimensions.width45),
                          child:TextFormField(
                            initialValue: text_phrase,
                            onChanged: (String? value){
                              setState(() {
                                text_phrase=value!;
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: 'Enter your phrase'
                            ),
                            validator: (String? value){
                              if(value==null || value.isEmpty){
                                return 'Please enter a phrase';
                              }
                              return null;
                            },
                          ),
                        ),
                        Center(
                          child: Container(
                            child:Padding(
                              padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
                              child: ElevatedButton(
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    //Processsing
                                    setState(() {
                                      loading_stage=true;
                                    });
                                    Timer(Duration(seconds: 3), () {
                                      setState(() {
                                        loading_stage=false;
                                      });
                                    });
                                    //loading_stage=true;
                                  }
                                },
                                child: Text('Submit'),
                              ),),
                          ),
                        )
                      ],
                    ) ,
                  ),
                ),
                /// Form ends here
                SizedBox(height: Dimensions.height30,),
              ],
            ),
      ),
        );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

}
