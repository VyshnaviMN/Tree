import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addQuizData(Map quizData, String quizId) async {
    await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .setData(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuestionData(Map quesData, String quizId) async {
    await Firestore.instance
        .collection('Quiz')
        .document(quizId)
        .collection("QNA")
        .add(quesData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getQuizData() async {
    return await Firestore.instance.collection("Quiz").snapshots();
  }

  getQuestionsData(String quizId) async {
    return await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .getDocuments();
  }

  Future<void> addStudentQuizResults(
      Map quizResults, String email, String quizId) async {
    return await Firestore.instance
        .collection("Students")
        .document(email)
        .collection('Quiz')
        .document(quizId)
        .setData(quizResults)
        .catchError((e) {
      print(e.toString());
    });
  }

  getStudentQuizResults(String email) async {
    return await Firestore.instance
        .collection('Students')
        .document(email)
        .collection('Quiz')
        .snapshots();
  }

  Future<void> addUserData(Map userData, String email) async {
    await Firestore.instance
        .collection('UserData')
        .document(email)
        .setData(userData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserData() async {
    return await Firestore.instance.collection("UserData").snapshots();
  }
}
