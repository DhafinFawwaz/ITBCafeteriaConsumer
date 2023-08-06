import 'package:flutter/material.dart';
import 'package:itb_cafeteria_consumer/data/StaticData.dart';
import 'package:itb_cafeteria_consumer/model/profile/profile_edit_model.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';

import '../../services/api_service.dart';
import '../../widgets/normal_button.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});


  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? username;
  String? telephone;

  void onSubmit() async
  {
    if(validateAndSave()) {

      ProfileEditRequest model = ProfileEditRequest(
        username: username!, telephone: telephone!,
      );

      APIService.editUserProfile(model).then((response) => {

        if(response.message != "success") {
          onEditFailed(response)
        }
        else {
          onEditSuccess()
        }
      });
    }
  }

  void onEditFailed(ProfileEditResponse response) {
    var snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onEditSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Profile edited successfully"),
    ));

    StaticData.profileData.data.username = username!;
    StaticData.profileData.data.telephone = telephone!;
    Navigator.pop(context);
  }

  bool validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Container(
        color: GlobalTheme.slate100,
        child: Padding(
          padding: EdgeInsets.all(GlobalTheme.padding1),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                  decoration: InputDecoration(
                    hintText: 'Your name',
                    labelText: 'Username'
                  ),
                  initialValue: StaticData.profileData.data.username,
                  onSaved: (value) => username = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '0812345678',
                    labelText: 'Telephone Number'
                  ),
                  initialValue: StaticData.profileData.data.telephone,
                  onSaved: (value) => telephone = value,
                ),
                const SizedBox(height: 20),
                NormalButton(
                    text: "Apply",
                    onPressed: onSubmit
                ),
                
              ],
            ),
          ),
        )
      ),
    );
  }
}