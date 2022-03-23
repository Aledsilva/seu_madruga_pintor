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


  String _resultadoFinal = "";

  String _alertaBotaoCalcular = "";

  String _alertaCamposParedes = "";

  double portaDimen = 2.40;
  double janelaDimen = 1.52;

  double lata_P = 0.5; //pinta 2.5m²
  double lata_M = 2.5; //pinta 12.5m²
  double lata_G = 3.6; //pinta 18m²
  double lata_XG = 18; //pinta 90m²

  double alturaP1 = 0;
  double larguraP1 = 0;
  int porta1 = 0;
  int janela1 = 0;
  double totalParede1 = 0;

  double alturaP2 = 0;
  double larguraP2 = 0;
  int porta2 = 0;
  int janela2 = 0;
  double totalParede2 = 0;

  double alturaP3 = 0;
  double larguraP3 = 0;
  int porta3 = 0;
  int janela3 = 0;
  double totalParede3 = 0;

  double alturaP4 = 0;
  double larguraP4 = 0;
  int porta4 = 0;
  int janela4 = 0;
  double totalParede4 = 0;

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
        _alertaBotaoCalcular = "Separe os números utilizando (.)";
      });
    }else{

      double resultadoFinal = totalParede1+totalParede2+totalParede3+totalParede4;

      setState(() {
        print("TA AQUI: $totalParede1, $totalParede2, $totalParede3, $totalParede4  $resultadoFinal");

        _resultadoFinal = "O tamanho total é de $resultadoFinal m2";

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
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.redAccent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const [
                            Text("Tamanho máximo 15m²",
                            textAlign: TextAlign.center,),
                            Text("Tamanho minimo 1m²",
                            textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),

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
                          onChanged: (text){


                            if(_controllerAlturaP1.text == ""){
                              setState(() {
                                alturaP1 = 0;
                                _alertaCamposParedes = "Preencha os campos";
                              });
                              print("AQUI: VAZIO $alturaP1");
                            }

                            alturaP1 = double.tryParse(_controllerAlturaP1.text)!;
                            print("AQUI ALTURA: $alturaP1");

                            if(alturaP1 * larguraP1 < 1 || alturaP1 * larguraP1 > 15
                            || alturaP1 <0 || larguraP1 < 0 ){
                              setState(() {
                                _alertaCamposParedes = "Preencha os campos";
                              });
                            }else{
                              totalParede1 = alturaP1 * larguraP1;
                              setState(() {
                                _alertaCamposParedes = "Área total: $totalParede1 m²";
                              });
                            }

                          }
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
                        onChanged: (text){

                          if(_controllerLarguraP1.text == ""){
                            setState(() {
                              larguraP1 = 0;
                              _alertaBotaoCalcular = "Preencha os campos";
                            });
                            print("AQUI: VAZIO $alturaP1");
                          }

                            larguraP1 = double.tryParse(_controllerLarguraP1.text)!;
                            print("AQUI LARGURA: $larguraP1");

                            if(_controllerLarguraP1.text.isEmpty || _controllerLarguraP1.text == ""){
                              setState(() {
                                larguraP1 = 0;
                                _alertaBotaoCalcular = "Preencha os campos";
                              });

                            }

                            if(alturaP1 * larguraP1 < 1 || alturaP1 * larguraP1 > 15
                                || alturaP1 <0 || larguraP1 < 0){
                              setState(() {
                                _alertaBotaoCalcular = "Preencha os campos";
                              });
                            }else{
                              totalParede1 = alturaP1 * larguraP1;
                              setState(() {
                                _alertaBotaoCalcular = "Área total: $totalParede1 m²";
                              });
                            }
                        },
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
                    Text(_alertaBotaoCalcular),
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
              _resultadoFinal,
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
