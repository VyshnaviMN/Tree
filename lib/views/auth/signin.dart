import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tree/helper/functions.dart';
import 'package:tree/helper/constants.dart';
import 'package:tree/services/auth.dart';
import 'package:tree/views/auth/signup.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tree/views/tabs_screens.dart';
import 'package:tree/widgets/buttons.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.signInEmailAndPass(email, password).then(
        (val) {
          if (val != null) {
            setState(() {
              _isLoading = false;
            });
            HelperFunctions.saveUserLoggedInDetails(email: email);
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => TabScreen(), /*Home(email)  HomePage()*/
              ),
            );
          } else {
            //TODO add msg here to display "incorrect email or password"
          }
        },
      );
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
                  size: 50,
                  color: kPink,
                ),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                // All Input elements are on top of image
                decoration: kSignInDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: GoogleFonts.poppins(textStyle: kTitleTextStyle),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        validator: (val) {
                          return val.isEmpty ? 'Enter Username' : null;
                        },
                        decoration: kUsernameDecoration,
                        style: kTextfieldStyle,
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return val.isEmpty ? 'Enter Password' : null;
                        },
                        decoration: kPasswordDecoration,
                        style: kTextfieldStyle,
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      PrimaryActionButton(
                        action: () => signIn(),
                        color: kPink,
                        text: 'Sign In',
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      SecondaryActionButton(
                        action: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        color: kPurple,
                        text: 'New User? Sign Up',
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
