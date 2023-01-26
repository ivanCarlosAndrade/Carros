import 'dart:convert';

import 'package:carros_front/ui/detalhe.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _url = 'http://127.0.0.1:8000/api/index';
  Future<Map>? _getfetch() async {
    http.Response response;
    response = await http.get(Uri.parse(_url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            'https://i.pinimg.com/originals/62/bd/4b/62bd4b6da2ad08120b9d6bd011070a5f.png'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 250, right: 250, top: 20, bottom: 20),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Pesquise a marca', border: OutlineInputBorder()),
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
            child: FutureBuilder(
          future: _getfetch(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Container();
              default:
                return _createCarTable(context, snapshot);
            }
          },
        ))
      ]),
    );
  }

  Widget _createCarTable(BuildContext, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 5.0),
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Image.network(
            "http://127.0.0.1:8000/api/image/" +
                snapshot.data["carros"][index]["imagem"],
                fit: BoxFit.cover,
                
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Detalhe(snapshot.data["carros"][index])));
          },
        );
      },
    );
  }
}
