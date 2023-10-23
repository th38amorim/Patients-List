import 'dart:convert';
import 'package:http/http.dart' as http;

class PatientsListRepository {
  final String owner = "anlix-io";
  final String repo = "desafio-anlix";
  final String directory = "dados";
  final String baseURL = "https://api.github.com/repos";

  Future<List<String>> getFilesFromDirectory() async {
    final response =
        await http.get(Uri.parse('$baseURL/$owner/$repo/contents/$directory'));

    if (response.statusCode == 200) {
      List<dynamic> files = jsonDecode(response.body);
      List<String> fileNames = [];

      for (var file in files) {
        fileNames.add(file['name']);
      }

      return fileNames;
    } else {
      print("Error Response: ${response.body}");
      throw Exception(
          'Failed to load files from GitHub: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  Future<String> getFileContent(String fileName) async {
    final response = await http
        .get(Uri.parse('$baseURL/$owner/$repo/contents/$directory/$fileName'));

    if (response.statusCode == 200) {
      var content = jsonDecode(response.body)['content'];

      print("Raw content: $content");

      if (content == null || content.isEmpty) {
        throw Exception('Received content is null or empty');
      }

      var cleanedContent = content.replaceAll("\n", "").replaceAll("\t", "");

      try {
        var decodedContent = utf8.decode(base64Decode(cleanedContent));
        return decodedContent;
      } catch (e) {
        print("Error decoding base64: $e");
        throw Exception('Error decoding base64 content');
      }
    } else {
      throw Exception('Failed to load file content from GitHub');
    }
  }
}
