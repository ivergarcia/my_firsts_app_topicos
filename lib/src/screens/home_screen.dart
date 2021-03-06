import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late TextEditingController _numero1Controller;
  late TextEditingController _numero2Controller;

  late num resultado = 0 ;

  late bool validar1 = false;

  late bool validar2 = false;

  sumar() {
    setState(() {
      if( _numero1Controller.text.isNotEmpty && _numero2Controller.text.isNotEmpty ) {
        resultado = num.parse(_numero1Controller.text) + num.parse(_numero2Controller.text);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _numero1Controller = TextEditingController();
    _numero2Controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _numero1Controller.dispose();
    _numero2Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SUMA',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(height: 30),
              TextField(
                controller: _numero1Controller,
                onChanged: ( String value ) {
                  setState(() {
                    (value.isNotEmpty) ? validar1 = false : validar1 = true;
                  });
                },
                keyboardType: TextInputType.number,
                
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  labelText: 'Numero 1',
                  hintText: 'ingrese un numero',
                  errorText: (validar1) ? 'Tiene que tener al menos un numero' : null
                ),
              ),
              Container(height: 10),
              TextField(
                controller: _numero2Controller,
                keyboardType: TextInputType.number,
                onChanged: ( String value ) {
                  setState(() {
                    (value.isNotEmpty) ? validar2 = false : validar2 = true;
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  labelText: 'Numero 2',
                  hintText: 'ingrese un numero',
                  errorText: (validar2) ? 'Tiene que tener al menos un numero' : null
                ),
              ),
              Container(height: 10),
              
              ElevatedButton(
                onPressed: () => sumar(), 
                child: Text('Resolver', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ))
              ),
              Container(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('RESULTADO:', style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),),
                  Container(width: 10),
                  Text('$resultado', style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
    );
  }
}