import 'package:flutter/material.dart';
import 'package:tree/views/profile_edit.dart';
import 'package:tree/widgets/widgets.dart';
import 'package:tree/helper/functions.dart';
import 'package:tree/services/database.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DatabaseService databaseService = new DatabaseService();
  String email = "";
  Stream quizStream;

  checkUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInDetails().then((val) {
      setState(() {
        if (val != "") {
          email = val;
        }
      });
    });
  }

  @override
  void initState() {
    // Quiz results only show result, for more detailed report add functionality in the play_quiz.dart file
    checkUserLoggedInStatus();
    print(email); // Check if email is available in Home page
    databaseService.getUserData().then((val) {
      setState(() {
        quizStream = val;
      });
    });
    super.initState();
  }

  quizList(String email) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return snapshot.data.documents[index].data['email'] == email
                        ? ProfileTile(
                            imageUrl:
                                snapshot.data.documents[index].data["imageUrl"],
                            name: snapshot.data.documents[index].data['name'],
                            dob: snapshot.data.documents[index].data["dob"],
                            semester:
                                snapshot.data.documents[index].data['semester'],
                            email: email,
                          )
                        : Text("");
                  },
                );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarOtherPages(context),
      body: quizList(email),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String imageUrl, name, dob, semester, email;
  ProfileTile(
      {@required this.imageUrl,
      @required this.name,
      @required this.dob,
      @required this.semester,
      @required this.email});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CreateProfile(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        height: 150,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "$imageUrl",
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "DOB: $dob",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sem : $semester",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
