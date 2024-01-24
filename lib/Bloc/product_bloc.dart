import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product/Repository/Api/API/ProductAPI.dart';
import '../Repository/Model_class/ProductModel.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductApi productApi = ProductApi();
  late ProductModel productModel;

  ProductBloc() : super(ProductInitial()) {
    on<Fetchprodect>((event, emit) async {
     emit (ProductBlocLoading());
     try {
       productModel = await productApi.getProduct(Product: event.Product);
       emit (ProductBlocLoaded());
     }
     catch (e){
       print(e);
       emit(ProductBlocError());
     }
    });
  }
}
