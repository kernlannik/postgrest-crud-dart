@Tags(['database'])
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:postgrest_crud/postgrest_crud.dart';
import '../setup.dart';
import '../mock.dart';

void main() {
  setUp(runSetup);

  test('DatabaseAuth', () async {
    testDatabase.httpClient = testMockClient(preResponse: (Request request) {
      expect(request.headers.containsKey('Authorization'), true);
      expect(request.headers['Authorization'], equals('Bearer TOKEN'));
    });

    await testDatabase.sendRequest(
        method: HttpMethod.get, modelName: "MockClass");
  });

  test('DatabaseDelete', () async {
    testDatabase.httpClient = testMockClient(preResponse: (Request request) {
      expect(request.method, equals(HttpMethod.delete.name));
      expect(
          request.url, equals(Uri.parse("http://localhost/MockClass?id=eq.1")));

      expect(request.headers.containsKey('Content-Profile'), true);
      expect(request.headers['Content-Profile'], equals('test'));
    });

    await testDatabase.delete(modelName: "MockClass", query: Query("?id=eq.1"));
  });

  test('DatabaseGet', () async {
    testDatabase.httpClient = testMockClient(preResponse: (Request request) {
      expect(request.method, equals(HttpMethod.get.name));
      expect(
          request.url, equals(Uri.parse("http://localhost/MockClass?id=eq.1")));

      expect(request.headers.containsKey('Accept-Profile'), true);
      expect(request.headers['Accept-Profile'], equals('test'));
    });

    await testDatabase.get(modelName: "MockClass", query: Query("?id=eq.1"));
  });

  test('DatabaseHead', () async {
    testDatabase.httpClient = testMockClient(preResponse: (Request request) {
      expect(request.method, equals(HttpMethod.head.name));
      expect(request.url, equals(Uri.parse("http://localhost/MockClass")));

      expect(request.headers.containsKey('Accept-Profile'), true);
      expect(request.headers['Accept-Profile'], equals('test'));
    });

    await testDatabase.head(modelName: "MockClass");
  });

  test('DatabasePatch', () async {
    testDatabase.httpClient = testMockClient(preResponse: (Request request) {
      expect(request.method, equals(HttpMethod.patch.name));
      expect(request.url, equals(Uri.parse("http://localhost/MockClass")));

      expect(request.headers.containsKey('Content-Profile'), true);
      expect(request.headers['Content-Profile'], equals('test'));

      expect(request.body, equals('{"id": 1}'));
    });

    await testDatabase.patch(modelName: "MockClass", body: '{"id": 1}');
  });

  test('DatabasePost', () async {
    testDatabase.httpClient = testMockClient(preResponse: (Request request) {
      expect(request.method, equals(HttpMethod.post.name));
      expect(request.url, equals(Uri.parse("http://localhost/MockClass")));

      expect(request.headers.containsKey('Content-Profile'), true);
      expect(request.headers['Content-Profile'], equals('test'));

      expect(request.body, equals('{"id": 1}'));
    });

    await testDatabase.post(modelName: "MockClass", body: '{"id": 1}');
  });

  test('DatabasePut', () async {
    testDatabase.httpClient = testMockClient(preResponse: (Request request) {
      expect(request.method, equals(HttpMethod.put.name));
      expect(request.url, equals(Uri.parse("http://localhost/MockClass")));

      expect(request.headers.containsKey('Content-Profile'), true);
      expect(request.headers['Content-Profile'], equals('test'));

      expect(request.body, equals('{"id": 1}'));
    });

    await testDatabase.put(modelName: "MockClass", body: '{"id": 1}');
  });
}
