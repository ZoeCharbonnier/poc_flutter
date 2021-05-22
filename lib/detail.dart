import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'model/dossier.dart';

class DetailPage extends StatelessWidget {
  final int index;

  DetailPage(this.index);

  Future<Dossier> fetchDossier() async {
    final response = await http.get(
      Uri.parse('https://localhost:44376'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'eyJhbGciOiJSUzI1NiIsImtpZCI6InlhTEVVeTlGbVJDeEFJR24zUWtwNnciLCJ0eXAiOiJhdCtqd3QifQ.eyJuYmYiOjE2MjE2ODUzMzAsImV4cCI6MTYyMTY4ODkzMCwiaXNzIjoiaHR0cHM6Ly9zc28tdGVzdC5hYXJpeGEuYmUiLCJhdWQiOiJueF9hcGkiLCJjbGllbnRfaWQiOiJueF9hcHAiLCJzdWIiOiIwNzNmZGJhNC01MTZlLTRlYjItOWIxZC1iODcxNTFjNWQwYjMiLCJhdXRoX3RpbWUiOjE2MjE2NzY0MDMsImlkcCI6IkF6dXJlQUQiLCJueF9vZmZpY2lhbF9jb2RlIjpbIjQxMDAyMDAwMjQiLCI0NDAyMTAwMDAxIl0sInJvbGUiOlsibmVnbGVjdC14LnN1cGVyYWRtaW4iLCJuZWdsZWN0LXgudXNlciIsIlNrb3J1YmFJZGVudGl0eUFkbWluQWRtaW5pc3RyYXRvciIsImVyYS1ub2Jpcy5hZG1pbiJdLCJueF9wZXJtaXNzaW9uIjpbIm54LndyaXRlIiwibngucmVhZCJdLCJzY29wZSI6WyJvcGVuaWQiLCJwcm9maWxlIiwiZW1haWwiLCJueF9wcm9maWxlIiwibnhfYXBpIiwib2ZmbGluZV9hY2Nlc3MiXSwiYW1yIjpbImV4dGVybmFsIl19.iErouZMkdCu9fLk_KWrX4jkWVH1yekFin1umOhxMkqk01wBk3WacJZ7LX6cBCRtfqVQTt5XGHD8p4j7PRfFXqJF8WvVHYjwN6sbORSMNPlaNKUQhIz7bQkI2g18iLFkf21kCGQQHDBA7rQLWKmFA1o4WpVTDjn6Ks8gJAN3I4gK_9PgSCNbB8n0LfNrlrCFCG2YaXYGVXNqoqtM0L9ow-6cLhQ3W9ZDqGznAGnUMehDuJz9angJZyozSDyNcMm6a4zIugIVV06GDD2v9CvWbph7IziNyjIWomJrL4Lsoe9csnr87jzU_vGmwmfevo8d-teIVxbhlOe2AZL4nC9_3KQ',
      },
    );
    final responseJson = jsonDecode(response.body);
    log('test: $responseJson');

    return Dossier.fromJson(responseJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("The details page"),
      ),
      body: Center(child: Text("The details page #$index")),
    );
  }
}