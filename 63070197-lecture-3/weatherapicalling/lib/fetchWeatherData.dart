import 'package:dio/dio.dart';

Future<String> fetchData(String url) async{
  Dio dio = Dio();
  Response response = await dio.get(url);
  return response.data.toString();
}
void main(List<String> args) async {
  var answer = await fetchData('https://api.openweathermap.org/data/2.5/weather?q=Bangkok&appid=b082329391d5d3425e9f91d5c758f20c');
  print(answer);
}
