// ignore_for_file: must_be_immutable

part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class Fetched extends ProductState {
  ProductModel? products;

  Fetched({
    required this.products,
  });
}

final class UnFetched extends ProductState {}

final class ProductError extends ProductState {
  final String errorMessage;
  ProductError({required this.errorMessage});
}

final class ProductBannerFetched extends ProductState {
  final ProductBannerModel? banners;

  ProductBannerFetched({required this.banners});
}

final class ProductBannerUnFetched extends ProductState {}

final class ProductBannerError extends ProductState {
  final String message;
  ProductBannerError({required this.message});
}
