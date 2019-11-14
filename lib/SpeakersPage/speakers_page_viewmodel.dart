import 'package:flutter/material.dart';
import 'package:tedx_app/SpeakersPage/speakers_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class SpeakersPageViewModel extends State<SpeakersPage> {
//TODO: Business Logic Here
  var data;

  getData() async {
    var response =
        await http.get('https://seasonsapp.co/ted/public/api/speakers');

    setState(() {
      data = json.decode(response.body);
    });
  }
}
