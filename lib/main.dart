import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_first_flutter_app/models/student.dart';
import 'package:my_first_flutter_app/screens/student_add.dart';

void main() {
  runApp(MyApp());
}

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // genellikle android görüntüsüne benziyor
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  // bunu artık tekrar tekrar kullanabilirim
  List student = [
    Student("John", "Lenon", 100),
    Student("Poul", "McCartney", 45),
    Student("George", "Harrison", 25),
    Student("Ringo", "Starr", 55)
  ];

  Student selectedstudent = Student("", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("öts"),
        ),
        body: buildBody());
  }

  buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: student.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(student[index].firstName +
                      " " +
                      student[index].secondName),
                  subtitle: Text("sınav notu: " +
                      student[index].grade.toString() +
                      " [" +
                      student[index].getStatus +
                      "]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://im.haberturk.com/2019/05/23/ver1558622944/2473354_810x458.jpg"),
                  ),
                  trailing: buildStatusIcon(student[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedstudent = student[index];
                    });
                  },
                  onLongPress: () {
                    print("uzun basıldı");
                  },
                );
              }),
        ),
        Text("seçili öğrenci: " + selectedstudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle")
                  ],
                ),
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(student)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni öğrenci")
                  ],
                ),
                onPressed: (){
                  print("yeni öğrenci");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("sil")
                  ],
                ),
                onPressed: (){
                  print("yeni öğrenci");
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
