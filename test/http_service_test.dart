import 'dart:convert';

import 'package:click_to_food/services/data/network_services/network_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockClient;
  late HttpService httpService;

  setUp(() {
    mockClient = MockHttpClient();
    httpService = HttpService(client: mockClient);
  });

  test('POST request sends correct data and receives response', () async {
    const url = 'https://example.com/api/v1/resource';
    const body = {
      "name": "John Doe",
      "email": "johndoe@example.com",
      "age": 30
    };

    const headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer YOUR_TOKEN"
    };

    if (kDebugMode) {
      print("jesonEncodedbody ${jsonEncode(body)}");
    }
    // Mock the HTTP response
    when(mockClient.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    )).thenAnswer((_) async => http.Response('{"success": true}', 200));

    // Call the service's POST method
    final response = await httpService.post(url, body: body, headers: headers);

    // Verify the response
    expect(response['success'], true);

    // Verify that the HTTP client's `post` method was called correctly
    verify(mockClient.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    )).called(1);
  });

  test('POST request throws an exception on error', () async {
    const url = 'https://example.com/api/v1/resource';
    const body = {
      "name": "John Doe",
      "email": "johndoe@example.com",
      "age": 30
    };

    const headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer YOUR_TOKEN"
    };

    // Mock the HTTP response to simulate an error
    when(mockClient.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    )).thenAnswer((_) async => http.Response('Error', 400));

    // Call the service's POST method and expect it to throw an exception
    expect(
        () async => await httpService.post(url, body: body, headers: headers),
        throwsException);
  });
}
