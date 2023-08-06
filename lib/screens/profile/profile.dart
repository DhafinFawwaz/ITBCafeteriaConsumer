import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itb_cafeteria_consumer/data/StaticData.dart';
import 'package:itb_cafeteria_consumer/model/profile/profile_model.dart';
import 'package:itb_cafeteria_consumer/services/api_service.dart';
import 'package:itb_cafeteria_consumer/services/shared_service.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';
import 'package:itb_cafeteria_consumer/widgets/normal_button.dart';

import '../../widgets/settings_button.dart';
import 'profile_edit.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {

  File? image;

  void getUserProfile() async {
    StaticData.profileData = await APIService.getUserProfile();
  }
  @override
  void initState() {
    super.initState();
    if(StaticData.profileData.message == "")
    {
      setState(() {
        getUserProfile();
      });
    }
  }

  void onImageEdit() async {
    print("Image Edit");

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;

      APIService.editUserImageProfile(image.path).then((response) => {
        setState(() {
          StaticData.profileData.data.image = response;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Profile edited successfully"),
            ));
        }),
      });

    } catch(e) {
      print('Failed to pick image: $e');
    }
    


    

  }


  void onEditSuccess() {
    
    Navigator.pop(context);
  }

  void NavigateToProfileEdit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ProfileEdit(),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    if(StaticData.profileData.data != null) {
      Data data = StaticData.profileData.data;
      if(data.image == "") {
        data.image = 'https://i.cbc.ca/1.5359228.1577206958!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_620/smudge-the-viral-cat.jpg';
      }
      return Container(
        color: GlobalTheme.slate100,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(GlobalTheme.padding1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    const SizedBox(height: GlobalTheme.padding1),
                  
                    Row(
                      children: [

                        InkWell(
                          onTap: onImageEdit,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              data.image,
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        
                        
                        const SizedBox(width: GlobalTheme.padding1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.username,
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${data.email}/${data.telephone}',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            // const SizedBox(height: 8),
                            // Text(
                            //   "Deskripsi deskripsi deskripsi",
                            //   style: TextStyle(
                            //     fontSize: 11,
                            //   ),
                            // )
                          ],
                        ),
                        Spacer(),
                        NormalButton(
                          text: "Edit", 
                          textColor: Colors.black,
                          backgroundColor: GlobalTheme.slate50,
                          onPressed: NavigateToProfileEdit
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: GlobalTheme.padding1),
                child: const Text(
                  "Pengaturan Akun",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800
                  ),
                ),
              ),
              
              const SizedBox(height: GlobalTheme.padding2),
              SettingsButton(
                icon: Icons.money_outlined,
                headerText: "Metode Pembayaran",
                descriptionText: 'E-wallet, Kredit',
                onPressed: () {}
              ),
              SettingsButton(
                icon: Icons.lock,
                headerText: "Keamanan",
                descriptionText: "Login 2FA, Password, biometrik",
                onPressed: () {}
              ),
              SettingsButton(
                icon: Icons.privacy_tip,
                headerText: "Privasi",
                descriptionText: "S & K",
                onPressed: () {}
              ),
              SettingsButton(
                icon: Icons.notifications,
                headerText: "Notifikasi",
                descriptionText: "Muted",
                onPressed: () {}
              ),
              SettingsButton(
                icon: Icons.logout,
                headerText: "Logout",
                descriptionText: "Keluar dari akun",
                onPressed: () {
                  SharedService.logout(context);
                }
              ),
            ],
          )
        ),
      );
    }
    return const Center(
          child: CircularProgressIndicator()
        );
      
  }
}