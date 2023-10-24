import 'dart:convert';
import 'package:http/http.dart' as http;

class PatientsListRepository {
  static const String owner = "th38amorim";
  static const String repo = "Patients-List";
  static const String baseUrl = "https://api.github.com/repos";

  Future<String> getFileContent() async {
    final response = await http
        .get(Uri.parse('$baseUrl/$owner/$repo/contents/pacientes.json'));

    if (response.statusCode != 200) {
      if (response.statusCode == 404) {
        throw Exception('File not found on GitHub');
      } else {
        throw Exception('Failed to load file content from GitHub');
      }
    }

    final content = _extractContentFromResponse(response);

    return _decodeContent(content);
  }

  String _extractContentFromResponse(http.Response response) {
    var responseBody = jsonDecode(response.body);
    var content = responseBody['content'];

    if (content == null || content.isEmpty) {
      throw Exception('Received content is null or empty');
    }

    return content;
  }

  String _decodeContent(String content) {
    var cleanedContent = content.replaceAll("\n", "").replaceAll("\t", "");

    try {
      return utf8.decode(base64Decode(cleanedContent));
    } catch (e) {
      throw Exception('Error decoding base64 content');
    }
  }
}
