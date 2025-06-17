import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gulfnet_clean_arch_1/src/domain/entities/post_entity.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';
@freezed
class PostModel with _$PostModel{
    const PostModel._();

    const factory PostModel({
     required int userId,
      required int id,
      required String title,
      required String body
}) = _PostModel;

    /// Creates a TodoModel from a JSON map.
    factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);


    /// Creates a TodoModel from a TodoEntity.
    factory PostModel.fromEntity(PostEntity entity) {
      return PostModel(
        userId: entity.userId,
        id: entity.id,
        title: entity.title,
        body: entity.body,
      );
    }


    /// Converts this TodoModel to a TodoEntity.
    PostEntity toEntity() {
      return PostEntity(
        userId: userId,
        id: id,
        title: title,
        body: body,
      );
    }

  @override
  // TODO: implement body
  String get body => throw UnimplementedError();

  @override
  // TODO: implement id
  int get id => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
  @override
  // TODO: implement userId
  int get userId => throw UnimplementedError();

}