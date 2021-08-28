import 'package:flutter_test/flutter_test.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';

import 'common.dart';

void main() {
  // ...

  test('Model Response Test', () {
    final gallery = GalleryModel.fromJson(exampleJsonResponse);

    expect(gallery.total, 1444029);
    expect(gallery.totalHits, 500);
    expect(gallery.hits![0].userId, 3764790);
    expect(gallery.hits![0].id, 6565499);
    expect(
      gallery.hits![0].user,
      'ELG21',
    );
    expect(
      gallery.hits![0].userImageURL,
      'https://cdn.pixabay.com/user/2021/03/08/19-47-06-54_250x250.jpg',
    );
  });
}
