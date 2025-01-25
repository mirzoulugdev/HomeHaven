import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "data")
  final List<Data> data;
  @JsonKey(name: "pagination")
  final Pagination pagination;

  ProductModel({
    required this.data,
    required this.pagination,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "short_description")
  final String shortDescription;
  @JsonKey(name: "icon")
  final String icon;
  @JsonKey(name: "image")
  final List<String> image;
  @JsonKey(name: "quintity")
  final int quintity;
  @JsonKey(name: "price")
  final double price;
  @JsonKey(name: "discount")
  final int discount;
  @JsonKey(name: "rating")
  final double rating;
  @JsonKey(name: "rating_count")
  final int ratingCount;
  @JsonKey(name: "color")
  final Color color;
  @JsonKey(name: "size")
  final Size size;
  @JsonKey(name: "category")
  final String category;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.icon,
    required this.image,
    required this.quintity,
    required this.price,
    required this.discount,
    required this.rating,
    required this.ratingCount,
    required this.color,
    required this.size,
    required this.category,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Color {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "color_hex_flutter")
  final String colorHexFlutter;

  Color({
    required this.name,
    required this.colorHexFlutter,
  });

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsToJson(this);
}

@JsonSerializable()
class Size {
  @JsonKey(name: "width")
  final int width;
  @JsonKey(name: "depth")
  final int depth;
  @JsonKey(name: "heigth")
  final int heigth;
  @JsonKey(name: "seat_width")
  final int seatWidth;
  @JsonKey(name: "seat_depth")
  final int seatDepth;
  @JsonKey(name: "seat_heigth")
  final int seatHeigth;

  Size({
    required this.width,
    required this.depth,
    required this.heigth,
    required this.seatWidth,
    required this.seatDepth,
    required this.seatHeigth,
  });

  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  Map<String, dynamic> toJson() => _$SizeToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "total_records")
  final int totalRecords;
  @JsonKey(name: "current_page")
  final int currentPage;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "next_page")
  final dynamic nextPage;
  @JsonKey(name: "prev_page")
  final dynamic prevPage;

  Pagination({
    required this.totalRecords,
    required this.currentPage,
    required this.totalPages,
    required this.nextPage,
    required this.prevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
