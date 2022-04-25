import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  late String name, lastname, dni;
  String sms = 'Datos completos';
  void erase(){
    setState(() {
      nameController.text = '';
      lastNameController.text = '';
      dniController.text = '';
      sms = 'Datos completos';
    });
  }
  void concatenar(){
    setState(() {
      // ignore: unrelated_type_equality_checks
      if(nameController.text != '' || lastNameController.text != '' ||dniController.text != ''  ){
        sms = nameController.text + ' ' + lastNameController.text + ' DNI:' + dniController.text ;
      }
      else{
        sms = 'Datos completos';
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 20),
                // ignore: prefer_const_constructors
                child: Text(
                  'Datos personales',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                height: 150,
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: Image.asset(
                  'assets/user.png',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 350,
                child:  TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingrese nombre',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 350,
                child:  TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingrese apellidos',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 350,
                child:  TextField(
                  controller: dniController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingrese DNI',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child:  Text(
                  sms,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: concatenar,
                      child:  const Text(
                         'Concatenar',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      color: Colors.blueAccent,
                    ),
                    MaterialButton(
                      onPressed: erase,
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Limpiar',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
