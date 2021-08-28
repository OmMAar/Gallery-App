import 'package:mockito/mockito.dart';
import 'package:nabed_test/data/network/gallery/gallery_api.dart';

class AppServiceMock extends Mock implements GalleryApi {}

///
/// Example JSON Response from the API : https://pixabay.com/api/?key=23086641-04f8751d38ce8bd30a872d6e2&page=1&per_page=20
///
final exampleJsonResponse = {
  "total": 1444029,
  "totalHits": 500,
  "hits": [
    {
      "id": 6565499,
      "pageURL":
          "https://pixabay.com/photos/nature-beach-outdoors-exploration-6565499/",
      "type": "photo",
      "tags": "nature, beach, outdoors",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/15/48/nature-6565499_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/gb98a5fda8f6b1405a42f164e72fa30abcac647966cb9eb5c091e7e0772956fba1542e60d19ce2e9651c9717ceb66eb8246c37902b14b4684aa8c376057f29442_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g4f6173696705dc12094e46121ce8b30f25b34047c68fb758d61310c37adff7503d5a692325a4f56bc9e9b02c3a14f8924883ceae4d903262b8580815d0570e05_1280.jpg",
      "imageWidth": 5568,
      "imageHeight": 3712,
      "imageSize": 5416133,
      "views": 13159,
      "downloads": 10992,
      "collections": 11,
      "likes": 68,
      "comments": 72,
      "userId": 3764790,
      "user": "ELG21",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/08/19-47-06-54_250x250.jpg"
    },
    {
      "id": 6565461,
      "pageURL":
          "https://pixabay.com/photos/kid-girl-playing-child-baby-6565461/",
      "type": "photo",
      "tags": "kid, girl, playing",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/15/39/kid-6565461_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g876dab8b7f974aa2d464408f2d80011fdaad50d6577f55767f8d18883e68b74b4613680c32fdb884bf5c74cef1027a91d315e92dd3bbc8368ff7aaac9aa08067_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/gd9fe36ba76d2c0dd4d07e00d1f16c43c8679e6f3d5b0f5da727610a5c5c6434f575eb083ace4cfc2dfc7122b3bc4a78a57c0582e49a5f28e72b72905ec4fffd9_1280.jpg",
      "imageWidth": 5374,
      "imageHeight": 3583,
      "imageSize": 7367451,
      "views": 14229,
      "downloads": 10034,
      "collections": 24,
      "likes": 59,
      "comments": 19,
      "userId": 9196359,
      "user": "Jupilu",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/08/25/15-53-44-108_250x250.jpg"
    },
    {
      "id": 6564516,
      "pageURL":
          "https://pixabay.com/photos/ruins-sunset-travel-outdoors-6564516/",
      "type": "photo",
      "tags": "ruins, sunset, travel",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/08/17/ruins-6564516_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/gc17bff19d1a42c17cdd7c97e85248a95b8eabf3cefabe10dc5b4af26614b518115c7a56c86ef0d4b253cf9b5d55eac6373222dccc57b49a7eb1080c1273913af_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/ge1a86ea014ba42f1717ff6bf0bf63294d659da58f1034a364ccb36d160bd286cbc3f04a19f8069915e6ef351293db13da3e6f5d3ffd8be8c60b5b69f3fb4c741_1280.jpg",
      "imageWidth": 6000,
      "imageHeight": 4000,
      "imageSize": 4137536,
      "views": 10599,
      "downloads": 10215,
      "collections": 8,
      "likes": 67,
      "comments": 79,
      "userId": 12696704,
      "user": "papazachariasa",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/07/28/20-54-40-235_250x250.jpg"
    },
    {
      "id": 6551183,
      "pageURL":
          "https://pixabay.com/photos/boat-river-woman-young-lake-6551183/",
      "type": "photo",
      "tags": "boat, river, woman",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/16/19/24/boat-6551183_150.jpg",
      "previewWidth": 100,
      "previewHeight": 150,
      "webformatURL":
          "https://pixabay.com/get/ga0ffb9f9feb1134a4d1793aa816cf630fb7a57e76686cfe2eac31718987fa494bd9d267785d02c91011525034198210016e6910e16225dc87d0e00d6a68ccdd1_640.jpg",
      "webformatWidth": 426,
      "webformatHeight": 640,
      "largeImageURL":
          "https://pixabay.com/get/gdfdbc6b9bb5c2e46ba1e78465811745a3b526206a595edd8f69098158751d11b702712939307a3df7dc7fed16c803ad2b775956bf00f80a45e67c82245ed8df0_1280.jpg",
      "imageWidth": 2194,
      "imageHeight": 3300,
      "imageSize": 2371226,
      "views": 38740,
      "downloads": 34335,
      "collections": 50,
      "likes": 108,
      "comments": 67,
      "userId": 6314823,
      "user": "Victoria_Borodinova",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/08/17/17-11-49-569_250x250.png"
    },
    {
      "id": 6564700,
      "pageURL":
          "https://pixabay.com/photos/soap-bubble-bubble-iridescent-6564700/",
      "type": "photo",
      "tags": "soap bubble, bubble, iridescent",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/09/49/soap-bubble-6564700_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g8262043cd53de21d8ac1486a3b043ee2081304f94ad5d7fb841c014cb6e130741aa62ce6e572abee2e084ebb96f80d53ca7ce3c9beda4c74f8776d5963e49dfe_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/gc69d11ce14dfbab0fa7b578f937b355fa64c15c9882e029624a175104b10d304bbba79c285c0d2444cbfa49005981789ccd932bfd6a7cda5458d14b91ac26b19_1280.jpg",
      "imageWidth": 5184,
      "imageHeight": 3456,
      "imageSize": 2879888,
      "views": 9659,
      "downloads": 9310,
      "collections": 4,
      "likes": 62,
      "comments": 56,
      "userId": 10327513,
      "user": "NickyPe",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/26/06-18-19-299_250x250.jpg"
    },
    {
      "id": 6570646,
      "pageURL":
          "https://pixabay.com/photos/cows-cattles-livestock-farm-6570646/",
      "type": "photo",
      "tags": "cows, cattles, livestock",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/24/13/12/cows-6570646_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g9dfab44ef046686796388cace9af2b0c579808b9f50ff75ffc9c4585308ccdc0efc59fd3c81f47ab791c582d6bc5e85b3acad60b9a9bb24908a7413e2f94ab69_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/gc6c14ec8a7b324559e4376655c428f9ab4a82e807b871ec6f4ef9fe39bf0184f77e37bbf07af18e53b1da7e99e843179594d1793998116c9009c24ce28380d3a_1280.jpg",
      "imageWidth": 5568,
      "imageHeight": 3712,
      "imageSize": 6747780,
      "views": 733,
      "downloads": 645,
      "collections": 5,
      "likes": 47,
      "comments": 48,
      "userId": 3764790,
      "user": "ELG21",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/08/19-47-06-54_250x250.jpg"
    },
    {
      "id": 6565497,
      "pageURL":
          "https://pixabay.com/photos/helicopter-fire-rescue-smoke-6565497/",
      "type": "photo",
      "tags": "helicopter, fire, rescue",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/15/48/helicopter-6565497_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g1df1132fd0459204469bc17c7051009818f01ea275030da18b53bbc5395c9265e6f2729aca44203b6a4f8f50c90d759456722ca03d009c254553a5c411ecb379_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/gcb57efcb026de94a3e45b792bd9025a6add7d4d5d9e2adbbcd39961ffb49a1a4c11e523ea3215d274b8283c3bce158f6efdc3c93277058db8900c3266a689111_1280.jpg",
      "imageWidth": 5568,
      "imageHeight": 3712,
      "imageSize": 6762552,
      "views": 6719,
      "downloads": 6582,
      "collections": 8,
      "likes": 53,
      "comments": 51,
      "userId": 3764790,
      "user": "ELG21",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/08/19-47-06-54_250x250.jpg"
    },
    {
      "id": 6565498,
      "pageURL":
          "https://pixabay.com/photos/aqueduct-restaurant-history-6565498/",
      "type": "photo",
      "tags": "aqueduct, restaurant, history",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/15/48/aqueduct-6565498_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/gd9482462e32bb8b9bbc2a78880ca1cbde3298785d5bdbcde8bc813fb7b309c50b83de539c02f4876c1b2ba92c205ed4bc219ce95761538ea93bca61fb005125d_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g23ba7355ee5c1ec7adc783a4e9849df26eba7fedb4cf230c67978b68e02860a1fffd30f1812d2fe96442d38135a697a0c00e18272251821291277340d9164503_1280.jpg",
      "imageWidth": 5568,
      "imageHeight": 3712,
      "imageSize": 5710558,
      "views": 7695,
      "downloads": 7561,
      "collections": 5,
      "likes": 47,
      "comments": 41,
      "userId": 3764790,
      "user": "ELG21",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/08/19-47-06-54_250x250.jpg"
    },
    {
      "id": 6568166,
      "pageURL":
          "https://pixabay.com/photos/northern-lights-ice-winter-mystic-6568166/",
      "type": "photo",
      "tags": "northern lights, ice, winter",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/23/16/07/northern-lights-6568166_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g60bf975d72a11e46968cb0e4dd4a66de9ec22d4117b496401eb024d86e13b9cb10f0cc604a0ea862f96a06a292d445d5191d8b20617b35cf41e12d8f388b2dfe_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g5b6c0dfd41cf05a19aaa7bbbf84f73f1c8afad8dd693723f0ac4a3467974f9a7cf3fe5e618696cb73ecd02a1ec5545388eba4e58ddeecfffa62573cdd76a555b_1280.jpg",
      "imageWidth": 7087,
      "imageHeight": 4724,
      "imageSize": 4544350,
      "views": 1233,
      "downloads": 1119,
      "collections": 7,
      "likes": 45,
      "comments": 44,
      "userId": 3764790,
      "user": "ELG21",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/08/19-47-06-54_250x250.jpg"
    },
    {
      "id": 6565004,
      "pageURL":
          "https://pixabay.com/photos/turkey-pigeon-bird-dove-ornithology-6565004/",
      "type": "photo",
      "tags": "turkey pigeon, bird, dove",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/12/34/turkey-pigeon-6565004_150.jpg",
      "previewWidth": 98,
      "previewHeight": 150,
      "webformatURL":
          "https://pixabay.com/get/gf535edeecd01e4e98824aabcf32469f438ca8a0d5ddf35aa132ffe5726c9f9cac71eec786279e33d5ca1cf4e49ecbff5b42cdf776dda4a1dd77ca1655081e7d1_640.jpg",
      "webformatWidth": 418,
      "webformatHeight": 640,
      "largeImageURL":
          "https://pixabay.com/get/g510b225d51a0fa12bb0c3395f261a8b408edd4f7de550eb96e03b6b60c4d1dc8e23aa480fd8ee48a7236662937130130ea358927549425501b1f7296f2ec7cfa_1280.jpg",
      "imageWidth": 3761,
      "imageHeight": 5755,
      "imageSize": 2031286,
      "views": 1778,
      "downloads": 1695,
      "collections": 2,
      "likes": 44,
      "comments": 41,
      "userId": 1767157,
      "user": "Capri23auto",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/08/18/14-53-19-88_250x250.jpg"
    },
    {
      "id": 6564708,
      "pageURL":
          "https://pixabay.com/photos/bird-duck-ornithology-species-6564708/",
      "type": "photo",
      "tags": "bird, duck, ornithology",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/09/55/bird-6564708_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g072b5b5beda6822c3a7f9eb5b9fc7c5d79b873cdb5754e054ee2de32e7773fd4d58d1e3045ea9351bad670271ba1a9ef80789748f39366113f7209ad6047f808_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g5bfffc941a8895e63ab9dd4ed88553097fab45d4f64b78535826000324e2f1b3c1bb08111d0f2c237bd29ef7d37a85118412fe78d485c5f59a9b6414b8a83d11_1280.jpg",
      "imageWidth": 5940,
      "imageHeight": 3960,
      "imageSize": 6194131,
      "views": 6530,
      "downloads": 6388,
      "collections": 4,
      "likes": 51,
      "comments": 48,
      "userId": 10327513,
      "user": "NickyPe",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/26/06-18-19-299_250x250.jpg"
    },
    {
      "id": 6559626,
      "pageURL":
          "https://pixabay.com/photos/flower-daisy-petals-flora-blossom-6559626/",
      "type": "photo",
      "tags": "flower, daisy, petals",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/20/06/52/flower-6559626_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/gd0f96857c6e615dfc5a5b6d6c7a4bf37db0f00de5e712e9a61afd0b59e91cf513687b1cb6d5bae8458162e97e029d38f4883114b7effd562a6da50da8e8f7879_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g807dd9483122538cf5f69d9ed286db873fec0d9c6e3c5525a01e5c53a740985e29509bea889dc7d0f33aadc4750ef0aaf3c3f2021ed05c1d0efa45151bc00199_1280.jpg",
      "imageWidth": 6240,
      "imageHeight": 4160,
      "imageSize": 3584508,
      "views": 13935,
      "downloads": 13535,
      "collections": 8,
      "likes": 61,
      "comments": 54,
      "userId": 10327513,
      "user": "NickyPe",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/26/06-18-19-299_250x250.jpg"
    },
    {
      "id": 6566255,
      "pageURL":
          "https://pixabay.com/photos/sunflower-flower-yellow-flower-6566255/",
      "type": "photo",
      "tags": "sunflower, flower, yellow flower",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/22/12/sunflower-6566255_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g7b089556fbbd39de99e7b22c6de23475401d6ff75a57cd6ee2139701face0746e97d62ad4e94b048cf37cea410d0a985fbae470084004dbe9728944c1556e95f_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 425,
      "largeImageURL":
          "https://pixabay.com/get/g3bff445ae13bbb5d599765ada2823d891fc8653d96466769fad9a56e7e8445d7791ac2742132bcb33be58618b590fcdbea32aade1964521c09cf5ea059b68d62_1280.jpg",
      "imageWidth": 6000,
      "imageHeight": 3988,
      "imageSize": 1950125,
      "views": 3681,
      "downloads": 3530,
      "collections": 6,
      "likes": 54,
      "comments": 49,
      "userId": 12752456,
      "user": "Mammiya",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/08/24/20-00-59-236_250x250.jpeg"
    },
    {
      "id": 6564604,
      "pageURL":
          "https://pixabay.com/photos/squirrel-rodent-looking-for-food-6564604/",
      "type": "photo",
      "tags": "squirrel, rodent, looking for food",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/08/59/squirrel-6564604_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g7b1ceb231aae0a4d8a7bd006fb192b16436b20b0419cdcb961e3d0cf15a142502eb4507b2123a4b4098e294280d9f48620690ba672d30888bcd29fdc0c299d32_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL":
          "https://pixabay.com/get/g6021b92591c5afb8042657710a20b47c51698c08657e9021afb955ee4b3fdd94f15e3611bf900acf481b9ff9485991d2a32ab3d69190a0c38eaa9f67af1d3975_1280.jpg",
      "imageWidth": 5825,
      "imageHeight": 3874,
      "imageSize": 3534384,
      "views": 5733,
      "downloads": 5551,
      "collections": 3,
      "likes": 54,
      "comments": 51,
      "userId": 1767157,
      "user": "Capri23auto",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/08/18/14-53-19-88_250x250.jpg"
    },
    {
      "id": 6567731,
      "pageURL":
          "https://pixabay.com/photos/foxtail-grass-pipe-cleaner-flower-6567731/",
      "type": "photo",
      "tags": "foxtail, grass, pipe cleaner",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/23/12/41/foxtail-6567731_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g6a501eb75fe6dd1c15e3645c4b726fa07cafa2f50196eb0a70aabe3020c86e569e6da131002190c04eae6ad9038d4da7c6496ed6ba78b1a2cc2dde999eb67893_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g2b25de243fedd9fb81c121dd0517ed1aa5aa9a6383e4a16b1c5416c5f859ef41db91adcca573d2d146ce05a1224661ddf3afc8e531e8906315d2d0dcc148c7b8_1280.jpg",
      "imageWidth": 5104,
      "imageHeight": 3403,
      "imageSize": 2718733,
      "views": 730,
      "downloads": 657,
      "collections": 5,
      "likes": 46,
      "comments": 45,
      "userId": 10327513,
      "user": "NickyPe",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/26/06-18-19-299_250x250.jpg"
    },
    {
      "id": 6565219,
      "pageURL":
          "https://pixabay.com/photos/bicycle-bicycle-saddle-rusty-6565219/",
      "type": "photo",
      "tags": "bicycle, bicycle saddle, rusty",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/22/14/11/bicycle-6565219_150.jpg",
      "previewWidth": 150,
      "previewHeight": 137,
      "webformatURL":
          "https://pixabay.com/get/g2b0a1d53aab8e1b81a3db29c3e551e4d7bba9a4f6c408828b376e9abda782ea72b0dd99adfaac754ee01d5f90bf8d49dcdf8656b99f8974a85b779301ec4a75f_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 586,
      "largeImageURL":
          "https://pixabay.com/get/gc008901256cce6a19924f2b485a13cca367a8613151a4de0f1ca3f949fcb259a41c6e52e60f350fe9e4bc58fd685f0ca33ec4c114eec6a07e393a50630f1a12d_1280.jpg",
      "imageWidth": 4182,
      "imageHeight": 3827,
      "imageSize": 3319667,
      "views": 2557,
      "downloads": 2395,
      "collections": 2,
      "likes": 51,
      "comments": 50,
      "userId": 3930681,
      "user": "matthiasboeckel",
      "userImageURL":
          "https://cdn.pixabay.com/user/2020/09/10/07-21-28-908_250x250.jpg"
    },
    {
      "id": 6567677,
      "pageURL":
          "https://pixabay.com/photos/grapes-fruits-food-fresh-healthy-6567677/",
      "type": "photo",
      "tags": "grapes, fruits, food",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/23/12/23/grapes-6567677_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g33d17737d5bba114ea272c8d71cd1216f77feae2a5836c5bb6b809c3e37f82aed7f11cc25bb5eb3b62236e6546d857cf51ee2f97c9c9fd57f599503d5ef4cfa8_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/gfdbbe5594cec2aa04579b843d79952f548680aeb23f0cf6d6a9160071abbbea5c1ba916d51173645bbb9e2e05d828f3825cdf868d3003d3b2a7120aa5291686c_1280.jpg",
      "imageWidth": 6088,
      "imageHeight": 4058,
      "imageSize": 5895552,
      "views": 2297,
      "downloads": 2203,
      "collections": 2,
      "likes": 42,
      "comments": 41,
      "userId": 10327513,
      "user": "NickyPe",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/26/06-18-19-299_250x250.jpg"
    },
    {
      "id": 6562529,
      "pageURL":
          "https://pixabay.com/photos/butterfly-flower-pollinate-6562529/",
      "type": "photo",
      "tags": "butterfly, flower, pollinate",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/21/11/22/butterfly-6562529_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/gd89d37faf3318a61fcd48137caca6eafd211178d1e7d8181aeacf1b1d4280ee3d8032bc4ddef0ecddaa79ad8b86eb1e2a55990b7c433c85f17359f9370257157_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g84108c2aaad8a381c6072d1188f8878b865c8534d70c385d2cb95adac01d48bdd127f1d34ada41577af5c9f40849ffa71a59e2553d78b4f4bcdd9ac4a1659b9b_1280.jpg",
      "imageWidth": 5184,
      "imageHeight": 3456,
      "imageSize": 4031815,
      "views": 15865,
      "downloads": 15358,
      "collections": 6,
      "likes": 52,
      "comments": 52,
      "userId": 10327513,
      "user": "NickyPe",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/26/06-18-19-299_250x250.jpg"
    },
    {
      "id": 6572229,
      "pageURL":
          "https://pixabay.com/photos/jay-bird-sitting-animal-plumage-6572229/",
      "type": "photo",
      "tags": "jay, bird, sitting",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/25/02/32/jay-6572229_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g27903305532c2305e9fca52c328e327fbdcb0930ae3daeb3d8136687c7f512261915ad0c312856c763d5eeb2385fd52012009935423295cd81f7d4c99152b922_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/gf94075598d7a3b17b84dae66d52d95c38d623c5d29c38ea39c54c6211eb759736fd41d1763ad36e6262da6b946cba9333a49dbd1c54bd5311f0c4803bcee81bf_1280.jpg",
      "imageWidth": 6000,
      "imageHeight": 4000,
      "imageSize": 2627272,
      "views": 301,
      "downloads": 252,
      "collections": 3,
      "likes": 38,
      "comments": 34,
      "userId": 1767157,
      "user": "Capri23auto",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/08/18/14-53-19-88_250x250.jpg"
    },
    {
      "id": 6569156,
      "pageURL":
          "https://pixabay.com/photos/cat-pet-feline-animal-fur-kitty-6569156/",
      "type": "photo",
      "tags": "cat, pet, feline",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/24/01/44/cat-6569156_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g26561ae1b47079ab7aeeccc51caea3fbb7e48cf471e166ef3c9f52d7c9923fb2d554dc16c6883d1e0d67188824b775d1ac6907f12a22ad70eeb225653b99e473_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL":
          "https://pixabay.com/get/g21c3bb49f058600780f454daca7fc4f6cdc475c075e55404d22f42d79ba314bea5c52ee7ee7aecbe305a5bd11aa3c6cf6989f1d196dde3cd7e0df56e81c850fe_1280.jpg",
      "imageWidth": 3000,
      "imageHeight": 1998,
      "imageSize": 841870,
      "views": 2841,
      "downloads": 915,
      "collections": 15,
      "likes": 22,
      "comments": 9,
      "userId": 14619215,
      "user": "lequangutc89",
      "userImageURL":
          "https://cdn.pixabay.com/user/2019/12/14/02-02-43-19_250x250.jpg"
    }
  ]
};

