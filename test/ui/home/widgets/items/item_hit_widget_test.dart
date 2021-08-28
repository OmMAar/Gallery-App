import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/ui/home/widgets/items/item_hit_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../common.dart';


void main() {
  HitsModel hitsModel = HitsModel();
  GalleryModel gallery;
  setUp(() {

    gallery = GalleryModel.fromJson(exampleJsonResponse);
    hitsModel = gallery.hits!.first;
  });

  testWidgets('Display Hit Item', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ItemHitWidget(
              item: hitsModel,
              width: 100,
            ),
          ),
        ),
      );

      final hitFinder = find.byType(ItemHitWidget);
      expect(hitFinder, findsOneWidget);

    });
  });
}