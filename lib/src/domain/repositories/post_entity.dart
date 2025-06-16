import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostEntity(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  PostEntity copyWith({int? userId, int? id, String? title, String? body}) {
    return PostEntity(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body);
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}
