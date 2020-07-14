import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/models/student.dart';

// ignore: must_be_immutable
class StudentAdd extends StatefulWidget {
  List student;

  StudentAdd(this.student);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  var stu = Student("", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("öğrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildSecondNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "öğrenci adı", hintText: "gaye"),
      onSaved: (String value) {
        stu.firstName = value;
      },
    );
  }

  buildSecondNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "öğrenci soyadı", hintText: "süner"),
      onSaved: (String value) {
        stu.secondName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "sınavdan aldığı puan", hintText: "100"),
      onSaved: (String value) {
        stu.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("kaydet"),
      onPressed: (){
        formKey.currentState.save();
        widget.student.add(stu);
        Navigator.pop(context);
      },
    );

  }
}
