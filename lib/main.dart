import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: "Contador de Pessoas", // esse title é um valor interno, visto apenas no código
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _pessoas = 0;
  String _infoText = "Esta aberto!";

  void _mudarPessoas(int delta){
    setState(() {
      _pessoas += delta;
      if (_pessoas < 0) {
        _infoText = "Mundo invertido?";
      } else if(_pessoas <= 10){
        _infoText = "Pode entrar!";
      } else{
        _infoText = "Lotado!!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            
            Text(
              "Pessoas: $_pessoas",
              style: TextStyle(color:Colors.white,
                fontWeight: FontWeight.bold),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: FlatButton(
                    onPressed: (){
                      _mudarPessoas(1);
                    },
                    child: Text("+1",
                    style: TextStyle(fontSize: 40.0,
                      color: Colors.white))
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: FlatButton(
                    onPressed: (){
                      _mudarPessoas(-1);
                    },
                    child: Text("-1",
                    style: TextStyle(fontSize: 40.0,
                      color: Colors.white))
                  ),
                )
              ],
            ),

            Text(
              _infoText,
              style: TextStyle(color:Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
            )

          ],
        )
      ]
    );
  }
}