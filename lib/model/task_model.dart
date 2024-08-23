class TaskModel {
  String? id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.isDone,
  });

// convert json(map) to object.
  factory TaskModel.fromFirestore(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json["dateTime"]),
      isDone: json["isDone"],
    );
  }

// convert object to json(map)
  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "dateTime": DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
      ).millisecondsSinceEpoch,
      "isDone": isDone,
    };
  }
}
