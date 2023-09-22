import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlearn1/services/apiService.dart';
import 'package:riverpodlearn1/constant/constant.dart';
import 'package:riverpodlearn1/models/product.dart';
import 'package:riverpodlearn1/models/custom_error.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class AppProductState {
  final bool isLoading;
  final bool? isSuccess;
  final String? errorMessage;

  AppProductState({this.isLoading = false, this.isSuccess, this.errorMessage});
}

class AddProductNotifier extends StateNotifier<AppProductState> {
  final ApiService apiService;
  final ProviderContainer _container;

  AddProductNotifier(this.apiService, this._container)
      : super(AppProductState());

  Future<void> addProduct(Product product, List images) async {
    state = AppProductState(isLoading: true);
    List<String> imageUrls = [];
    if (images != null && images.isNotEmpty) {
      for (AssetEntity asset in images) {
        File? file = await convertAssetToFile(asset);
        if (file != null) {
          String? imageUrl = await uploadImageToFirebase(file);
          if (imageUrl != null) {
            imageUrls.add(imageUrl);
          }
        }
      }
    }
    try {
      final finalProduct = Product(
        name: product.name,
        description: product.description,
        price: product.price,
        status: product.status,
        image_urls: imageUrls,
      );

      final response =
          await apiService.post(API.products.add, finalProduct.toJson());

      _container
          .read(navigationServiceProvider)
          .showAlert('Alert', 'Product is added ');
      state = AppProductState(isLoading: false, isSuccess: true);
    } catch (error) {
      if (error is CustomError) {
        state = AppProductState(isLoading: false, errorMessage: error.message);
        Future.delayed(const Duration(seconds: 5), _clearError);
      } else {
        state =
            AppProductState(isLoading: false, errorMessage: error.toString());
        Future.delayed(const Duration(seconds: 5), _clearError);
      }
    }
  }

  void _clearError() {
    state =
        AppProductState(isLoading: state.isLoading, isSuccess: state.isSuccess);
  }

  Future<String?> uploadImageToFirebase(File imageFile) async {
    try {
      // Create a unique file name for the upload
      String filePath = 'products/${DateTime.now()}.png';

      // Upload to Firebase
      await FirebaseStorage.instance.ref(filePath).putFile(imageFile);

      // Get the download URL
      String downloadURL =
          await FirebaseStorage.instance.ref(filePath).getDownloadURL();

      return downloadURL;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<File?> convertAssetToFile(AssetEntity asset) async {
    return await asset.file;
  }
}

final addProductnProvider =
    StateNotifierProvider<AddProductNotifier, AppProductState>((ref) =>
        AddProductNotifier(ref.read(apiServiceProvider), ref.container));
