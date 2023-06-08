import 'package:flutter/material.dart';
import 'package:tree/services/database.dart';
import 'package:tree/widgets/widgets.dart';

class StudentQuizResults extends StatefulWidget {
  final String email;
  StudentQuizResults(this.email);
  @override
  _StudentQuizResultsState createState() => _StudentQuizResultsState();
}

class _StudentQuizResultsState extends State<StudentQuizResults> {
  DatabaseService databaseService = new DatabaseService();
  Stream resultsStream;

  resultsList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: StreamBuilder(
        stream: resultsStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return ResultTile(
                      total: snapshot.data.documents[index].data['total'],
                      correct: snapshot.data.documents[index].data['correct'],
                      incorrect:
                          snapshot.data.documents[index].data['incorrect'],
                      quizName: snapshot.data.documents[index].data['quizName'],
                    );
                  },
                );
        },
      ),
    );
  }

  @override
  void initState() {
    databaseService.getStudentQuizResults(widget.email).then((val) {
      setState(() {
        resultsStream = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(context), body: resultsList());
  }
}

class ResultTile extends StatelessWidget {
  //final String quizId;
  final String total, correct, incorrect, quizName;
  ResultTile({
    //@required this.quizId,
    @required this.total,
    @required this.correct,
    @required this.incorrect,
    @required this.quizName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 150,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue[300],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Title : $quizName",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Total : ${total}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  "Correct : ${correct}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  "Incorrect : ${incorrect}",
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
    );
  }
}
