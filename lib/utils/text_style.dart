import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_player/utils/my_color.dart';

class MyTextStyle {
//head style
  static TextStyle head_style = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24.0);

  static TextStyle head_style2 = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24.0);

  static TextStyle head_style3 = const TextStyle(
      color: Color(0xffA0A0A0), fontWeight: FontWeight.w500, fontSize: 14.0);

//search style
  static TextStyle search_style = const TextStyle(
      color: Color(0xffA0A0A0), fontWeight: FontWeight.w500, fontSize: 14.0);

  static TextStyle hint_search = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.0);

//Filter
  static TextStyle filter_txt_style = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.0);

  static TextStyle genre_txt_style = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12.0);

//Detail Page

  static TextStyle title_movie = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24.0);

//Epizodes
  static TextStyle title_description = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24.0);

  static TextStyle description_text = const TextStyle(
      color: Color(0xffA0A0A0), fontWeight: FontWeight.w500, fontSize: 14.0);

  static TextStyle episodes = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.0);

//Page PlayList
  static TextStyle txt_play_list = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24.0);

//Search page style
  static TextStyle search_page_style = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 20.0, color: MyColor.white);

//Search card titile style
  static TextStyle Search_card_titile = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 18.0, color: MyColor.white);

//Search card titile style
  static TextStyle Search_card_sub_titile = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14.0, color: MyColor.dark);


//profile page
//name_title
static TextStyle name_title = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 20.0, color: MyColor.white);

//email_profile
static TextStyle email_profile = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14.0, color: MyColor.dark);

//list_tile 
static TextStyle list_tile = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 20.0, color: MyColor.white);


//save button edit 
static TextStyle save_button = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 16.0, color: MyColor.white);

//Input text color 
static TextStyle Input_text_color = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16.0, color: MyColor.white);

      
}
