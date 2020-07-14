class Student {
  int id;
  String firstName;
  String secondName;
  int grade;
  String status;

  Student(String firstName, String secondName, int grade) {
    this.firstName = firstName;
    this.secondName = secondName;
    this.grade = grade;
  }

  Student.withId(int id, String firstName, String secondName, int grade) {
    this.firstName = firstName;
    this.secondName = secondName;
    this.grade = grade;
    this.id = id;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "geçti";
    } else if (this.grade > 40) {
      message = "bütünlemeye kaldı";
    } else {
      message = "kaldı";
    }
    return message;
  }
}
