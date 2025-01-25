// To parse this JSON data, do
//
//     final productBannerModel = productBannerModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'product_banner_model.g.dart';

ProductBannerModel productBannerModelFromJson(String str) =>
    ProductBannerModel.fromJson(json.decode(str));

String productBannerModelToJson(ProductBannerModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductBannerModel {
  @JsonKey(name: "data")
  final List<Datum> data;
  @JsonKey(name: "pagination")
  final Pagination pagination;

  ProductBannerModel({
    required this.data,
    required this.pagination,
  });

  factory ProductBannerModel.fromJson(Map<String, dynamic> json) =>
      _$ProductBannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBannerModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "short_description")
  final String shortDescription;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "date")
  final String date;

  Datum({
    required this.id,
    required this.title,
    required this.category,
    required this.shortDescription,
    required this.image,
    required this.date,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
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
