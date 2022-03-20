import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _controllerAlturaP1 = TextEditingController();
  final TextEditingController _controllerLarguraP1 = TextEditingController();

  final TextEditingController _controllerAlturaP2 = TextEditingController();
  final TextEditingController _controllerLarguraP2 = TextEditingController();

  final TextEditingController _controllerAlturaP3 = TextEditingController();
  final TextEditingController _controllerLarguraP3 = TextEditingController();

  final TextEditingController _controllerAlturaP4 = TextEditingController();
  final TextEditingController _controllerLarguraP4 = TextEditingController();


  String _textoResultado = "";

  double porta = 2.40;
  double janela = 1.52;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if(_counter >0 ) {
      setState(() {
        _counter--;
      }
      );
    }
  }

  void _calcular(){

    double? alturaParede1 = double.tryParse(_controllerAlturaP1.text);
    double? larguraParede1 = double.tryParse(_controllerLarguraP1.text);

    double? alturaParede2 = double.tryParse(_controllerAlturaP2.text);
    double? larguraParede2 = double.tryParse(_controllerLarguraP2.text);

    double? alturaParede3 = double.tryParse(_controllerAlturaP3.text);
    double? larguraParede3 = double.tryParse(_controllerLarguraP3.text);

    double? alturaParede4 = double.tryParse(_controllerAlturaP4.text);
    double? larguraParede4 = double.tryParse(_controllerLarguraP4.text);

    if( alturaParede1 == null || larguraParede1 == null
        || alturaParede2 == null || larguraParede2 == null
        || alturaParede3 == null || larguraParede3 == null
        || alturaParede4 == null || larguraParede4 == null
    ) {
      setState(() {
        _textoResultado = "Separe os números utilizando (.)";
      });
    }else{
      double resultP1 = alturaParede1 * larguraParede1;
      double resultP2 = alturaParede2 * larguraParede2;
      double resultP3 = alturaParede3 * larguraParede3;
      double resultP4 = alturaParede4 * larguraParede4;

      double resultadoFinal = resultP1+resultP2+resultP3+resultP4;

      setState(() {
        print("TA AQUI: $resultP1, $resultP2, $resultP3, $resultP4  $resultadoFinal");

        _textoResultado = "O tamanho total é de $resultadoFinal m2";

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text("Madruga"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 20),
            child: Text("Quanta tinta será necessária?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text("Parede 1",
                      style: TextStyle(
                        fontSize: 25,
                      ),),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura, ex. 3.20",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        style: const TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerAlturaP1,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Largura, ex. 5.00",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        style: const TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerLarguraP1,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Deseja adicionar algo?",
                        style: TextStyle(
                          fontSize: 25,
                        ),),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                          _decrementCounter();
                        },
                        ),
                        const Text(
                          'Porta ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$_counter]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          _incrementCounter();
                        },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                          _decrementCounter();
                        },
                        ),
                        const Text(
                          'Janela ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$_counter]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          _incrementCounter();
                        },
                        )
                      ],
                    ),


                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text("Parede 2",
                      style: TextStyle(
                        fontSize: 25,
                      ),),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura, ex. 3.20",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        style: const TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerAlturaP2,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Largura, ex. 5.00",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        style: const TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerLarguraP2,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Deseja adicionar algo?",
                        style: TextStyle(
                          fontSize: 25,
                        ),),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                          _decrementCounter();
                        },
                        ),
                        const Text(
                          'Porta ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$_counter]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          _incrementCounter();
                        },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                          _decrementCounter();
                        },
                        ),
                        const Text(
                          'Janela ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$_counter]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          _incrementCounter();
                        },
                        )
                      ],
                    ),


                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text("Parede 3",
                      style: TextStyle(
                        fontSize: 25,
                      ),),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura, ex. 3.20",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        style: const TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerAlturaP3,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Largura, ex. 5.00",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        style: const TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerLarguraP3,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Deseja adicionar algo?",
                        style: TextStyle(
                          fontSize: 25,
                        ),),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                          _decrementCounter();
                        },
                        ),
                        const Text(
                          'Porta ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$_counter]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          _incrementCounter();
                        },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                          _decrementCounter();
                        },
                        ),
                        const Text(
                          'Janela ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$_counter]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          _incrementCounter();
                        },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text("Parede 4",
                      style: TextStyle(
                        fontSize: 25,
                      ),),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura, ex. 3.20",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        style: const TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerAlturaP4,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Largura, ex. 5.00",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        style: const TextStyle(
                            fontSize: 22
                        ),
                        controller: _controllerLarguraP4,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Deseja adicionar algo?",
                        style: TextStyle(
                          fontSize: 25,
                        ),),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                          _decrementCounter();
                        },
                        ),
                        const Text(
                          'Porta ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$_counter]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          _incrementCounter();
                        },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                          _decrementCounter();
                        },
                        ),
                        const Text(
                          'Janela ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$_counter]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          _incrementCounter();
                        },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.only(top: 50),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _calcular();
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                padding: const EdgeInsets.all(15),
              ),
              child: const Text("Calcular"),
            ),),
             Padding(padding: const EdgeInsets.only(top: 20),
            child: Text(
              _textoResultado,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
