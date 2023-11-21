import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String note;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  String remind;
  @HiveField(5)
  String id;

  TodoModel(
    this.title,
    this.date,
    this.note,
    this.remind,
    this.time,
    this.id,
  );
}
