import 'package:flutter/material.dart';
import 'package:tree/helper/constants.dart';
import 'package:tree/helper/functions.dart';
import 'package:tree/services/auth.dart';
import 'package:tree/views/courseQuiz.dart';
import 'package:tree/views/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tree/views/tabs_screens.dart';
import 'package:tree/widgets/buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.signUpWithEmailAndPassword(email, password).then((val) {
        if (val != null) {
          setState(() {
            _isLoading = false;
          });
          HelperFunctions.saveUserLoggedInDetails(email: email);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TabScreen())); // Code change here: to add user email
        } else {
          //TODO add msg here to display "incorrect email or password"
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.yellow[50], // navigation bar color
      statusBarColor: Colors.yellow[50], // status bar color
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _isLoading
          ? Container(
              child: Center(
                child: SpinKitChasingDots(
                  color: kPink,
                  size: 50,
                ),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                decoration: kSignInDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello',
                        style: GoogleFonts.poppins(textStyle: kTitleTextStyle),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        validator: (val) {
                          return val.isEmpty ? 'Enter Name' : null;
                        },
                        decoration: kUsernameDecoration.copyWith(
                            hintText: 'Enter Your Name'),
                        style: kTextfieldStyle,
                        onChanged: (val) {
                          name = val;
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        validator: (val) {
                          return val.isEmpty ? 'Enter Username' : null;
                        },
                        decoration: kUsernameDecoration.copyWith(
                            hintText: 'Create Username'),
                        style: kTextfieldStyle,
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return val.isEmpty ? 'Enter Password' : null;
                        },
                        decoration: kPasswordDecoration.copyWith(
                            hintText: 'Create Password'),
                        style: kTextfieldStyle,
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      PrimaryActionButton(
                        action: () => signUp(),
                        color: kPink,
                        text: 'Sign Up',
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      SecondaryActionButton(
                        action: () {
                          Navigator.pop(context);
                        },
                        color: kPurple,
                        text: 'Back To Sign In',
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
