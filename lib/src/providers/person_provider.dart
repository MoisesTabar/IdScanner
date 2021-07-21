import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:id_scanner/src/models/person_model.dart';
import 'package:http/http.dart' as http;

class PersonProvider extends ChangeNotifier{
  final String? url = dotenv.env['ID_API'];

  Future<Person> fetchPersonData(String id) async {
    final response = await http.get(Uri.parse('$url/$id')); 
    return personFromJson(response.body);
  }
}