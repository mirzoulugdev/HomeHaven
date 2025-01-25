part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class FetchProductEvent extends ProductEvent {}

final class FetchProductBanner extends ProductEvent {}
