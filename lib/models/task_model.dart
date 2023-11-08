class TaskModel {
  String id;
  String title;
  int date;
  bool complete;

  TaskModel({this.id = '',
    required this.title,
    required this.date,
    required this.complete});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      complete: json['complete']);


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "date": date,
      "complete": complete,
    };
  }
}
