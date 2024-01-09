// import 'package:http/http.dart' as http;
// Future<void> fetchRecipes() async {
//   final url =
//   Uri.parse('https://streaming-availability.p.rapidapi.com/search/filters?services=prime.subscription&country=us&order_by=original_title&genres_relation=and&show_type=series');
//   final response = await http.get(
//     url,
//     headers: {
//       'X-RapidAPI-Key': 'eac1c58a2amshf238eb1a168ed97p150e4bjsnc914ce30b42b',
//       'X-RapidAPI-Host': 'streaming-availability.p.rapidapi.com'
//     },
//   );
//   print(response.body);
//
// }
import 'package:http/http.dart' as http;

Future<void> fetchRecipes(service) async {
  // İsteği oluştur.
  final url = Uri.https('streaming-availability.p.rapidapi.com', '/search/filters', {
    'services': service,
    'country': 'us',
    'output_language': 'en',
    'show_type': 'series'
  });

  final headers = {
    'X-RapidAPI-Key': 'eac1c58a2amshf238eb1a168ed97p150e4bjsnc914ce30b42b',
    'X-RapidAPI-Host': 'streaming-availability.p.rapidapi.com'
  };

  try {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final responseData = await response.body.toString();
      print('Yanıt veri: $responseData');
    } else {
      print('Hata: ${response.statusCode}');
    }
  } catch (error) {
    print('İstek hatası: $error');
  }
}