import 'dart:convert';


List<SliderModel>  sliderfromJSON(String strJson) =>List<SliderModel>.from(
    jsonDecode(strJson).map((x)=> SliderModel.fromJson(x))); 

class SliderModel{


  String? url;

  SliderModel({this.url});

  SliderModel.fromJson(Map<String , dynamic> json){

    url = json['url'];

  }

}