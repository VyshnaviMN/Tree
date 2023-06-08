import 'package:flutter/material.dart';

const Color kPink = Color(0xfff7cec7);
const Color kPurple = Color(0xffbbc6fb);
const Color kTitleTextColor = Colors.black45;

const kTitleTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);

const kButtonTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const kSignInDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("images/signingifnew.gif"),
    fit: BoxFit.cover,
  ),
);

const kUsernameDecoration = InputDecoration(
  hintText: 'Username',
  hintStyle: TextStyle(color: kPurple),
  prefixIcon: Icon(
    Icons.email,
    color: kPurple,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kPurple,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(color: kPurple, width: 1.0),
  ),
);

const kPasswordDecoration = InputDecoration(
  hintText: 'Password',
  hintStyle: TextStyle(color: kPurple),
  prefixIcon: Icon(Icons.enhanced_encryption, color: kPurple),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPurple, width: 3.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

const kTextfieldStyle = TextStyle(
  color: kPurple,
);

// Cards
var kCourseCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
);

const kCourseCardConstraints = BoxConstraints(
  maxHeight: 100,
  maxWidth: 100,
);

const kCourseCardTitleTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 40,
);

const kCourseCardDescTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

// Home Page
const kHomePageGreetingTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 50,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.25,
);

const kHomePageDescTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 20,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.5,
);

const kSearchBoxdecoration = InputDecoration(
  hintText: 'Search...',
  hintStyle: TextStyle(color: Colors.black54),
  prefixIcon: Icon(
    Icons.search,
    color: Colors.black,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
    borderSide: BorderSide(color: kPurple, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kPink,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);

// PlayQuizVideo

const kQuizPageTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 35,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.0,
);

const kQuizPageGreetingTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 25,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.0,
);

const kVideoNumberStyle = TextStyle(
  color: Color(0xffe8ebf6),
  fontSize: 60,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.5,
);

const kVideoDurationStyle = TextStyle(
  color: Color(0xffe0e0f0),
  fontSize: 20,
  fontWeight: FontWeight.w600,
  letterSpacing: 2.0,
);

const kVideoTitleStyle = TextStyle(
  color: Color(0xff000000),
  fontSize: 20,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.0,
);

var kPlayQuizCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(50),
  color: Color(0xff49cc96),
);
