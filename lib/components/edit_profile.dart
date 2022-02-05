import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_player/components/user_preferences.dart';
import 'package:movie_player/utils/my_color.dart';
import 'package:movie_player/utils/text_style.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  
  //Date Picker
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000, 1, 1),
        lastDate: DateTime(2022, 12, 29));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: MyColor.primary_dark,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(IconlyLight.arrowLeft2)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImage(),

            //TextFormFields
            InputField(
              hint: 'Your Name',
            ),
            InputField(
              hint: 'Email',
            ),

            InkWell(
              onTap: (){

                 _selectDate(context);
                  Text('Select date');
                
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20.0 , left: 10.0 , right: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  color: MyColor.primary , 
                  borderRadius: BorderRadius.circular(12.0)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: MyTextStyle.Input_text_color,
                    ),
                  ),
                ),
              ),
            ),

            InputField(
              hint: 'Password',
            ),

            Container(
              margin: EdgeInsets.only(top: 70.0),
              width: 200.0,
              height: 50.0,
              child: Center(
                  child: Text(
                'Save',
                style: MyTextStyle.save_button,
              )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blue),
            )
          ],
        ),
      )),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 53.0,
              child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/C4D03AQEvB7Ht3tJeNw/profile-displayphoto-shrink_100_100/0/1619258362978?e=1645056000&v=beta&t=bBYnutByezrQFilKz8PbzThLyLMivmbx-Qz_8FAMU7k',
                  )),
            ),
            Positioned(
              top: 80.0,
              left: 80.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Icon(
                  IconlyBold.camera,
                  color: Colors.white70,
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}

class InputField extends StatelessWidget {
  String hint;

  InputField({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: TextFormField(
        style: MyTextStyle.Input_text_color,
        decoration: InputDecoration(
            fillColor: MyColor.primary,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
            hintText: hint,
            hintStyle: TextStyle(color: MyColor.white)),
      ),
    );
  }
}
