import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  const Lesson({ required this.id,
    required this.type,
    required this.status,
    required this.name,
    required this.updateAt});

  final int id;
  final String type;
  final String status;
  final String name;
  final int updateAt;

  @override
  List<Object> get props => [id, type, status, name, updateAt];
}