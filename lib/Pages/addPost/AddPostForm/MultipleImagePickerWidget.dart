import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class MultipleImagePickerWidget extends HookConsumerWidget {
  final ValueNotifier<List<AssetEntity>> assets;
  MultipleImagePickerWidget({required this.assets});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final assets = useState<List<AssetEntity>>([]);

    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final List<AssetEntity>? result = await AssetPicker.pickAssets(
              context,
              pickerConfig: AssetPickerConfig(
                maxAssets: 5,
                requestType: RequestType.image,
              ),
              // maxAssets: 5,
              // requestType: RequestType.image, // Uncomment if you want to pick only images.
            );

            if (result != null) {
              assets.value = result;
            }
          },
          child: Icon(Icons.camera_alt, color: Colors.black),
        ),
        // Remove the GridView if you don't want to display the images right away

        Flexible(
          child: GridView.builder(
            itemCount: assets.value.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              mainAxisSpacing: 0.0, // Adjust the spacing as needed
              crossAxisSpacing: 4.0, // Adjust the spacing as needed
            ),
            itemBuilder: (context, index) {
              return AssetThumbnail(
                asset: assets.value[index],
                onRemove: () {
                  assets.value = List.from(assets.value)
                    ..removeAt(index); // Remove the asset at the current index
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// You can keep the AssetThumbnail widget as is, if you plan to use it elsewhere.
class AssetThumbnail extends StatelessWidget {
  final AssetEntity asset;
  final VoidCallback? onRemove;

  AssetThumbnail({required this.asset, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset.thumbnailData,
      builder: (BuildContext context, snapshot) {
        final Uint8List? data = snapshot.data;
        if (!snapshot.hasData || data == null) {
          return CircularProgressIndicator();
        }

        return Stack(
          children: [
            // The Image
            ClipOval(
              child: Container(
                width: 60,
                height: 60,
                child: Image.memory(
                  data,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // The "X" Icon
            Positioned(
              // right: 20, // Adjusted values
              top: 2,
              left: 35, // Adjusted values
              child: Container(
                width: 20, // Adjusted values
                height: 20, // Adjusted values
                decoration: BoxDecoration(
                  color: Colors.black38,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero, // No padding to make it smaller
                  icon: Icon(Icons.close,
                      size: 12, color: Colors.white), // Adjusted size
                  onPressed: onRemove ?? () {},
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
