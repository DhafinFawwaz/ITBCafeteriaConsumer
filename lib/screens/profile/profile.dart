import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:itb_cafeteria_consumer/model/profile/profile_model.dart';
import 'package:itb_cafeteria_consumer/services/api_service.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';
import 'package:itb_cafeteria_consumer/widgets/normal_button.dart';

import '../../widgets/settings_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  late Data data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileResponse>(
      future: APIService.getUserProfile(),
      builder: (BuildContext context, AsyncSnapshot<ProfileResponse> snapshot) {
        if(snapshot.hasData) {
          data = snapshot.data!.data;
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.network(
                                data.image,
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              ),
                            ),
                            
                            const SizedBox(width: GlobalTheme.padding1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.username,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${data.email}/${data.telephone}',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Deskripsi deskripsi deskripsi",
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            NormalButton(
                              text: "Edit", 
                              textColor: Colors.black,
                              backgroundColor: GlobalTheme.slate50,
                              onPressed: () {}
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
                    descriptionText: '${data.email}/${data.telephone}',
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
                    onPressed: () {}
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
      
    );
  }
}