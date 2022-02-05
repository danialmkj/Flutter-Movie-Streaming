import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_player/components/edit_profile.dart';
import 'package:movie_player/utils/my_color.dart';
import 'package:movie_player/utils/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://media-exp1.licdn.com/dms/image/C4D03AQEvB7Ht3tJeNw/profile-displayphoto-shrink_100_100/0/1619258362978?e=1645056000&v=beta&t=bBYnutByezrQFilKz8PbzThLyLMivmbx-Qz_8FAMU7k')),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Danial MJK', style: MyTextStyle.name_title),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(children: [
                        Text('danialmaleki@gmail.com',
                            style: MyTextStyle.email_profile),
                        const SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          child: Icon(IconlyBold.edit, color: Colors.blue),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (contex)=> EditProfile()));
                          },)
                      ])
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'My Account',
                      style: MyTextStyle.email_profile,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),

                  tileWidget(name: 'Personal Info',),
                  tileWidget(name: 'Language',),
                  tileWidget(name: 'Payout Information',),

                  SwitchListTile(
                    value: true,
                    onChanged: (myValue) {
                      myValue = false;
                    },
                    title: Text('Notification', style: MyTextStyle.list_tile),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                    child: Text(
                      'Information',
                      style: MyTextStyle.email_profile,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),

                  tileWidget(name: 'Apps Version'),
                  tileWidget(name: 'How we  Works'),
                  tileWidget(name: 'Contact Us'),
                  
                  //Logut
                  ListTile(
                    leading: Icon(
                      IconlyLight.logout,
                      color: MyColor.white,
                    ),
                    title: Text(
                      'Log Out',
                      style: MyTextStyle.list_tile,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class tileWidget extends StatelessWidget {
  String name;

  tileWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        name,
        style: MyTextStyle.list_tile,
      ),
      trailing: Icon(
        IconlyLight.arrowRight2,
        color: MyColor.white,
      ),
    );
  }
}
