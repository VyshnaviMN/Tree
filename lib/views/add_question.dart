import 'package:flutter/material.dart';
import 'package:tree/services/database.dart';
import 'package:tree/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion(this.quizId);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  String ques, op1, op2, op3, op4;

  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;

  uploadQuestion() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      Map<String, String> quesData = {
        "question": ques,
        "Option 1": op1,
        "Option 2": op2,
        "Option 3": op3,
        "Option 4": op4,
      };
      await databaseService
          .addQuestionData(quesData, widget.quizId)
          .then((val) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: _isLoading
          ? Container(
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.green[700],
              )),
            )
          : Form(
              key: _formKey,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter Question' : null,
                      decoration: InputDecoration(hintText: 'Question'),
                      onChanged: (val) {
                        ques = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter Correct Answer' : null,
                      decoration:
                          InputDecoration(hintText: 'Option 1(Correct answer)'),
                      onChanged: (val) {
                        op1 = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter Option 2' : null,
                      decoration: InputDecoration(hintText: 'Option 2'),
                      onChanged: (val) {
                        op2 = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter Option 3' : null,
                      decoration: InputDecoration(hintText: 'Option 3'),
                      onChanged: (val) {
                        op3 = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter Option 4' : null,
                      decoration: InputDecoration(hintText: 'Option 4'),
                      onChanged: (val) {
                        op4 = val;
                      },
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: button(context, 'Submit'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                uploadQuestion();
                              },
                              child: button(context, 'Add question')),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              )),
    );
  }
}
