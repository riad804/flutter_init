import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/todo.dart';


part 'todo_model.g.dart';


@JsonSerializable()
class TodoModel {
  final int id;
  final String title;
  final bool completed;


  TodoModel({required this.id, required this.title, required this.completed});


  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);


  Todo toEntity() => Todo(id: id, title: title, completed: completed);
}