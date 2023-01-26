import 'package:flutter/material.dart';

class Detalhe extends StatelessWidget {
  final Map _getData;

  Detalhe(this._getData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.network(
              'https://i.pinimg.com/originals/62/bd/4b/62bd4b6da2ad08120b9d6bd011070a5f.png'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 900,
                  height: 350,
                  child: Image.network(
                    "http://127.0.0.1:8000/api/image/" + _getData["imagem"],
                    fit: BoxFit.cover,
                  ),
                ),
                
                Container(
                  
                   width: 900,
                  height: 150,
                  child: Column(children: [
                    
                    Text(_getData["marca"]),
                    Text(_getData["ilha"]),
                    Text(_getData["valor"].toString()),
                    Text(_getData["kilometragem"].toString()),


                  ],)
                )
              ],
            ),
          ),
        ));
  }
}
/*
 Image.network(
            "http://127.0.0.1:8000/api/image/" + _getData["imagem"]),
*/