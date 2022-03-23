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

  double portaDimen = 2.40;
  double janelaDimen = 1.52;

  double lata_P = 0.5; //pinta 2.5m²
  double lata_M = 2.5; //pinta 12.5m²
  double lata_G = 3.6; //pinta 18m²
  double lata_XG = 18; //pinta 90m²



  int porta1 = 0;
  int janela1 = 0;

  int porta2 = 0;
  int janela2 = 0;

  int porta3 = 0;
  int janela3 = 0;

  int porta4 = 0;
  int janela4 = 0;

  // void _incrementCounter(int num) {
  //   setState(() {
  //     num++;
  //   });
  // }
  //
  // void _decrementCounter(int num) {
  //   if(num >0 ) {
  //     setState(() {
  //       num--;
  //     });
  //   }
  // }

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
        title: const Text("Seu Madruga: O Pintor"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 20),
            child: Text("Quanta tinta será necessária?",
            textAlign: TextAlign.center,
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


                          if(porta1 >0){
                            setState(() {
                              porta1--;
                            });
                          }

                        },
                        ),
                        const Text(
                          'Porta ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$porta1]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          setState(() {
                            porta1++;
                          });
                        },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                            setState(() {
                              if(janela1 >0){
                                janela1--;
                              }
                            });
                        },
                        ),
                        const Text(
                          'Janela ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$janela1]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                          setState(() {
                            janela1++;
                          });
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
                            setState(() {
                              if(porta2 >0){
                                porta2--;
                              }
                            });
                        },
                        ),
                        const Text(
                          'Porta ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$porta2]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                            setState(() {
                              porta2++;
                            });
                        },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                            setState(() {
                              if(janela2 >0){
                                janela2--;
                              }
                            });
                        },
                        ),
                        const Text(
                          'Janela ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$janela2]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                            setState(() {
                              janela2++;
                            });
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
                            setState(() {
                              if(porta3>0){
                                porta3--;
                              }
                            });
                        },
                        ),
                        const Text(
                          'Porta ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$porta3]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                            setState(() {
                              porta3++;
                            });
                        },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                            setState(() {
                              if(janela3>0){
                                janela3--;
                              }
                            });
                        },
                        ),
                        const Text(
                          'Janela ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$janela3]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                            setState(() {
                              janela3++;
                            });
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
                            setState(() {
                              if(porta4>0){
                                porta4--;
                              }
                            });
                        },
                        ),
                        const Text(
                          'Porta ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$porta4]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                            setState(() {
                              porta4++;
                            });
                        },
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle), onPressed: () {
                            setState(() {
                              if(janela4>0){
                                janela4--;
                              }
                            });
                        },
                        ),
                        const Text(
                          'Janela ',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          '[$janela4]',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle), onPressed: () {
                            setState(() {
                              janela4++;
                            });
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
