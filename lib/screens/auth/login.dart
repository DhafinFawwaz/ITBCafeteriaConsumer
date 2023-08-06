import 'package:flutter/material.dart';
import 'package:itb_cafeteria_consumer/model/auth/login_model.dart';
import '../../services/api_service.dart';
import '../../widgets/normal_button.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess = false; // can be used to show loading indicator
  bool hidePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  

  void onSubmit() async
  {
    if(validateAndSave()) {
      setState(() {
        isAPIcallProcess = true;
      });

      LoginRequest model = LoginRequest(email: email!, password: password!);

      APIService.login(model).then((response) => {
        setState(() {
          isAPIcallProcess = false;
        }),


        if(response.message != "success") {
          onLoginFailed(response)
        }
        else {
          onLoginSuccess()
        }
      });
    }
  }

  void onLoginFailed(LoginResponse response) {
    var snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onLoginSuccess() {
    print("Login success");
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
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
                  text: "Login",
                  onPressed: onSubmit
              ),
              const SizedBox(height: 10),
              const Text("or", textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    child: const Text("Register", 
                      style: TextStyle(
                        decoration: TextDecoration.underline
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  )
                ],
              )

            ],
          ),
        )
      ),
    );
  }

}