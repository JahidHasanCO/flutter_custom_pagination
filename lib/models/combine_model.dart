enum ItemType { post, product }

abstract class CombineModel {
  final ItemType type;
  CombineModel({required this.type});
}
