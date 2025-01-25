import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import '../../../data/models/product_banner_model.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository_impl.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositoryImpl productRepo;

  ProductBloc({required this.productRepo}) : super(ProductInitial()) {
    on<FetchProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await productRepo.getProducts();
        if (result != null) {
          log("BLOC: ${result} products fetched successfully.");
          emit(Fetched(products: result));
        } else {
          emit(UnFetched());
        }
      } catch (e) {
        log("Error occurred: $e");
        emit(ProductError(
            errorMessage: "Failed to fetch products. Please try again."));
      }
    });

    on<FetchProductBanner>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await productRepo.getProductBanner();
        if (result != null) {
          log("BLOC Banner: ${result.data.toList()} products fetched successfully.");
          emit(ProductBannerFetched(banners: result));
        } else {
          emit(ProductBannerUnFetched());
        }
      } catch (e) {
        log("Error occurred: $e");
        emit(ProductBannerError(
            message: "Failed to fetch products. Please try again."));
      }
    });
  }
}
