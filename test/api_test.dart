import 'package:blogapp/src/services/web_services/blog_api_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("API should responds its version code!", () async {
    final BlogApiServices blogApiServices = BlogApiServices();
    expect(blogApiServices.fetchBaseUrl(), isNull);
  });
}