import 'package:flutter/material.dart';
import '../../model/register_model.dart';
import '../../services/api_service.dart';
import '../../widgets/floating_back_button.dart';
import '../../widgets/normal_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? password;

  void onSubmit()
  {
    
    if(validateAndSave()) {
      setState(() {
        isAPIcallProcess = true;
      });

      RegisterRequest model = RegisterRequest(username: username!, email: email!, password: password!);

      APIService.register(model).then((response) => {
        setState(() {
          isAPIcallProcess = false;
        }),
        if(response.message != "success") {
          onRegisterSuccess(response)
        }
        else {
          onRegisterFailed(response)
        }
      });
    }
  }
  
  void onRegisterFailed(RegisterResponse response) {
    var snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void onRegisterSuccess(RegisterResponse response) {
    var snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body:  Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(height: 60),
                  const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.name, // Use email input type for emails.
                    decoration: InputDecoration(
                      hintText: 'your name',
                      labelText: 'Username'
                    ),
                    onSaved: (value) => username = value,

                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                    decoration: InputDecoration(
                      hintText: 'you@example.com',
                      labelText: 'E-mail Address'
                    ),
                    onSaved: (value) => email = value,
                  ),
                  TextFormField(
                    obscureText: true, // Use secure text for passwords.
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Enter your password'
                    ),
                    onSaved: (value) => password = value,
                  ),
                  const SizedBox(height: 20),
                  NormalButton(
                      text: "Register",
                      onPressed: onSubmit
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text("or", textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        child: const Text("Login",
                          style: TextStyle(
                            decoration: TextDecoration.underline
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                
                ],
              ),
            ),

          ),
          
          Positioned(
            top: 20,
            left: 10,
            child: FloatingBackButton(Colors.black),
          ),
        ],
      )
      
      
    );
  }
}