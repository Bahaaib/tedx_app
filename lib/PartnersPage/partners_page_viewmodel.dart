import 'package:flutter/material.dart';
import 'package:tedx_app/PartnersPage/partners_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class PartnersPageViewModel extends State<PartnersPage> {
  //TODO: Business Logic Here
  var data;

  getData() async {
    var response =
        await http.get('https://seasonsapp.co/ted/public/api/partners');

    setState(() {
      data = json.decode(response.body);
    });
  print(data);

  }

}
