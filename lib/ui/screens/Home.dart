import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //CONTROLLERS: eles que capturam os valores digitados
  final TextEditingController _controllerAlturaP1 = TextEditingController();
  final TextEditingController _controllerLarguraP1 = TextEditingController();

  final TextEditingController _controllerAlturaP2 = TextEditingController();
  final TextEditingController _controllerLarguraP2 = TextEditingController();

  final TextEditingController _controllerAlturaP3 = TextEditingController();
  final TextEditingController _controllerLarguraP3 = TextEditingController();

  final TextEditingController _controllerAlturaP4 = TextEditingController();
  final TextEditingController _controllerLarguraP4 = TextEditingController();

  //BOOLS: Utilizados para validar a VISIBILIDADE dos respectivos parâmetros
  bool alertaDimenP1 = false;
  bool alertaDimenP2 = false;
  bool alertaDimenP3 = false;
  bool alertaDimenP4 = false;

  bool alertaJanela1 = false;
  bool alertaPorta1 = false;

  bool alertaJanela2 = false;
  bool alertaPorta2 = false;

  bool alertaJanela3 = false;
  bool alertaPorta3 = false;

  bool alertaJanela4 = false;
  bool alertaPorta4 = false;

  bool portasJanelasP1 = false;
  bool portasJanelasP2 = false;
  bool portasJanelasP3 = false;
  bool portasJanelasP4 = false;

  bool botaoCalcularVisivel = false;

  //Valores utilizados na soma e texto final
  double litrosNecessarios = 0;
  double litrosParaTexto = 0;

  //VALORES FIXOS: Estes são os parâmetros dados pela regra de negócio
  double janelaDimen = 2.40;
  double portaDimen = 1.52;
  double litrosLata_P = 0.5; //pinta 2.5m²
  double litrosLata_M = 2.5; //pinta 12.5m²
  double litrosLata_G = 3.6; //pinta 18m²
  double litrosLata_XG = 18; //pinta 90m²

  //Alertas que se alteram ao longo das funções para auxiliar o usuário
  String _alertaCamposP1 = "";
  String _alertaCamposP2 = "";
  String _alertaCamposP3 = "";
  String _alertaCamposP4 = "";

  //VARIÁVEIS: Os valores abaixo se alteram conforme o fluxo do App
  //os valores não podem começar vázios, por isso são iniciados em 0
  int qtdLatasP = 0;
  int qtdLatasM = 0;
  int qtdLatasG = 0;
  int qtdLatasXG = 0;

  double alturaP1 = 0;
  double larguraP1 = 0;
  int qtdPorta1 = 0;
  int qtdJanela1 = 0;
  double totalParede1 = 0;

  double alturaP2 = 0;
  double larguraP2 = 0;
  int qtdPorta2 = 0;
  int qtdJanela2 = 0;
  double totalParede2 = 0;

  double alturaP3 = 0;
  double larguraP3 = 0;
  int qdtPorta3 = 0;
  int qtdJanela3 = 0;
  double totalParede3 = 0;

  double alturaP4 = 0;
  double larguraP4 = 0;
  int qtdPorta4 = 0;
  int qtdJanela4 = 0;
  double totalParede4 = 0;

  double paredesTotalFinal = 0;

  //FUNÇÃO DE CÁLCULO

  //Ao chamar, esta função irá calcular toda a estrutura anterior e resolver
  // a questão : "Quantas e quais latas preciso para pintar as minhas paredes?"
  void _calcular() {
    qtdLatasXG = 0;
    qtdLatasG = 0;
    qtdLatasM = 0;
    qtdLatasP = 0;
    //Aqui abaixo obtemos o valor total das paredes
    paredesTotalFinal =
        totalParede1 + totalParede2 + totalParede3 + totalParede4;
    //Aqui abaixo pegamos a quantidade de tinta necessária
    //Temos duas varíaveis pois uma é alterada dentro do metódo e outra irá para o texto final
    litrosNecessarios = paredesTotalFinal / 5;
    litrosParaTexto = paredesTotalFinal / 5;

    //MÉTODOS WHILE:
    //Eles tem uma tolerância de sobra para oferecer latas maiores e também garantir que não irá faltar
    //o setState() fora fo While é para trazer de volta o valor de litros necessários e não atrapalar o looping seguinte
    while (litrosNecessarios - litrosLata_XG >= -6) {
      litrosNecessarios = litrosNecessarios - litrosLata_XG;
      qtdLatasXG++;
    }
    setState(() {
      litrosNecessarios = litrosParaTexto;
    });

    while (litrosNecessarios >= litrosLata_XG) {
      litrosNecessarios = litrosNecessarios - litrosLata_XG;
      qtdLatasXG++;
    }

    setState(() {
      litrosNecessarios = litrosParaTexto;
    });

    while (litrosNecessarios >= litrosLata_G || litrosNecessarios - litrosLata_G >= -3.1) {
      litrosNecessarios = litrosNecessarios - litrosLata_G;
      qtdLatasG++;
      print("latas G : $qtdLatasG");
      print("uma de 3,6");
      print("LITROS: $litrosNecessarios");
    }
    setState(() {
      litrosNecessarios = litrosParaTexto;
    });

    while (litrosNecessarios >= litrosLata_M || litrosNecessarios - litrosLata_M >= -2) {
      litrosNecessarios = litrosNecessarios - litrosLata_M;
      qtdLatasM++;
    }
    setState(() {
      litrosNecessarios = litrosParaTexto;
    });

    while (litrosNecessarios >= litrosLata_P || litrosNecessarios - litrosLata_P >= 0.4 ) {
      litrosNecessarios = litrosNecessarios - litrosLata_P;
      qtdLatasP++;
    }
    setState(() {
      litrosNecessarios = litrosParaTexto;
    });
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
            Container(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0,10,0,10),
                child: Text(
                  "Quanta tinta será necessária?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Parede 1",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Visibility(
                      visible: alertaDimenP1,
                      child: SizedBox(
                        width: 250,
                        height: 60,
                        child: _cardAlertaDeDimensoes(
                            "Tamanho minimo 1m²", "Tamanho máximo 15m²", 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura (mínima 2.20)",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15))),
                        style: const TextStyle(fontSize: 22),
                        controller: _controllerAlturaP1,
                        onChanged: (text) {

                          //A seguinte estrutura não pôde ser transformada em uma função
                          //por isso ela irá se repetir nas próximas paredes portas e janelas
                          if (_controllerAlturaP1.text.isEmpty ||
                              _controllerAlturaP1.text == "") {
                            //essa validação reseta a lógica caso o usuário apague os campos
                            setState(() {
                              alturaP1 = 0;
                              portasJanelasP1 = false;
                              qtdJanela1 = 0;
                              qtdPorta1 = 0;
                              alertaJanela1 = false;
                              alertaPorta1 = false;
                              _alertaCamposP1 =
                                  "Por favor, preencha os campos corretamente";
                            });
                          }

                          alturaP1 = double.tryParse(_controllerAlturaP1.text)!;

                          if (alturaP1 * larguraP1 < 1 ||
                              alturaP1 * larguraP1 > 15 ||
                              alturaP1 < 2.20) {
                            //valida se as condições batem com a regra de negócio
                            //se SIM temos os valores totais, se NÃO teremos alertas de erro na tela
                            setState(() {
                              _alertaCamposP1 = "";
                              alertaDimenP1 = true;
                              portasJanelasP1 = false;
                            });
                          } else {
                            totalParede1 = alturaP1 * larguraP1;
                            setState(() {
                              alertaDimenP1 = false;
                              portasJanelasP1 = true;
                              _alertaCamposP1 = "Área total: $totalParede1 m²";
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Largura",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15))),
                        style: const TextStyle(fontSize: 22),
                        controller: _controllerLarguraP1,
                        onChanged: (text) {
                          if (_controllerLarguraP1.text.isEmpty ||
                              _controllerLarguraP1.text == "") {
                            setState(() {
                              larguraP1 = 0;
                              portasJanelasP1 = false;
                              qtdJanela1 = 0;
                              qtdPorta1 = 0;
                              alertaJanela1 = false;
                              alertaPorta1 = false;
                              _alertaCamposP1 =
                                  "Por favor, preencha os campos corretamente";
                            });
                          }

                          larguraP1 =
                              double.tryParse(_controllerLarguraP1.text)!;

                          if (alturaP1 * larguraP1 < 1 ||
                              alturaP1 * larguraP1 > 15 ||
                              alturaP1 < 2.20) {
                            setState(() {
                              _alertaCamposP1 = "";
                              alertaDimenP1 = true;
                              portasJanelasP1 = false;
                            });
                          } else {
                            totalParede1 = alturaP1 * larguraP1;
                            setState(() {
                              alertaDimenP1 = false;
                              portasJanelasP1 = true;
                              _alertaCamposP1 = "Área total: $totalParede1 m²";
                            });
                          }
                        },
                      ),
                    ),
                    Visibility(
                      visible: portasJanelasP1,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Deseja adicionar algo?",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  if (qtdPorta1 == 0) {
                                    setState(() {
                                      alertaPorta1 = false;
                                    });
                                  } else if (qtdPorta1 > 0) {
                                    setState(() {
                                      totalParede1 = totalParede1 + portaDimen;
                                      qtdPorta1--;
                                      _alertaCamposP1 =
                                          "Área total: $totalParede1 m²";
                                    });
                                  }
                                },
                              ),
                              const Text(
                                'Porta ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '[$qtdPorta1]',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  if (totalParede1 / 2 < portaDimen) {
                                    setState(() {
                                      alertaPorta1 = true;
                                    });
                                  } else {
                                    setState(() {
                                      totalParede1 = totalParede1 - portaDimen;
                                      qtdPorta1++;
                                      _alertaCamposP1 =
                                          "Área total: $totalParede1 m²";
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          const Text("2.40m²"),
                          const Divider(color: Colors.white),
                          Visibility(
                            visible: alertaPorta1,
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: _cardAlertaDeDimensoes(
                                  "Espaço insuficiente!",
                                  "Item ocupa mais de 50% do espaço total",
                                  16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  if (qtdJanela1 == 0) {
                                    setState(() {
                                      alertaJanela1 = false;
                                    });
                                  } else if (qtdJanela1 > 0) {
                                    setState(() {
                                      totalParede1 = totalParede1 + janelaDimen;
                                      qtdJanela1--;
                                      _alertaCamposP1 =
                                          "Área total: $totalParede1 m²";
                                    });
                                  }
                                },
                              ),
                              const Text(
                                'Janela ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '[$qtdJanela1]',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  if (totalParede1 / 2 < janelaDimen) {
                                    setState(() {
                                      alertaJanela1 = true;
                                    });
                                  } else {
                                    setState(() {
                                      totalParede1 = totalParede1 - janelaDimen;
                                      qtdJanela1++;
                                      _alertaCamposP1 =
                                          "Área total: $totalParede1 m²";
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          const Text("1.52m²"),
                          const Divider(color: Colors.white),
                          Visibility(
                            visible: alertaJanela1,
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: _cardAlertaDeDimensoes(
                                  "Espaço insuficiente!",
                                  "Item ocupa mais de 50% do espaço total",
                                  16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _alertaCamposP1,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
                    const Text(
                      "Parede 2",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Visibility(
                      visible: alertaDimenP2,
                      child: SizedBox(
                        width: 250,
                        height: 60,
                        child: _cardAlertaDeDimensoes(
                            "Tamanho minimo 1m²", "Tamanho máximo 15m²", 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura (mínima 2.20)",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15))),
                        style: const TextStyle(fontSize: 22),
                        controller: _controllerAlturaP2,
                        onChanged: (text) {
                          if (_controllerAlturaP2.text.isEmpty ||
                              _controllerAlturaP2.text == "") {
                            setState(() {
                              alturaP2 = 0;
                              portasJanelasP2 = false;
                              qtdJanela2 = 0;
                              qtdPorta2 = 0;
                              alertaJanela2 = false;
                              alertaPorta2 = false;
                              _alertaCamposP2 =
                                  "Por favor, preencha os campos corretamente";
                            });
                          }

                          alturaP2 = double.tryParse(_controllerAlturaP2.text)!;

                          if (alturaP2 * larguraP2 < 1 ||
                              alturaP2 * larguraP2 > 15 ||
                              alturaP2 < 2.20) {
                            setState(() {
                              _alertaCamposP2 = "";
                              alertaDimenP2 = true;
                              portasJanelasP2 = false;
                            });
                          } else {
                            totalParede2 = alturaP2 * larguraP2;
                            setState(() {
                              alertaDimenP2 = false;
                              portasJanelasP2 = true;
                              _alertaCamposP2 = "Área total: $totalParede2 m²";
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Largura",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15))),
                        style: const TextStyle(fontSize: 22),
                        controller: _controllerLarguraP2,
                        onChanged: (text) {
                          if (_controllerLarguraP2.text.isEmpty ||
                              _controllerLarguraP2.text == "") {
                            setState(() {
                              larguraP2 = 0;
                              portasJanelasP2 = false;
                              qtdJanela2 = 0;
                              qtdPorta2 = 0;
                              alertaJanela2 = false;
                              alertaPorta2 = false;
                              _alertaCamposP2 =
                                  "Por favor, preencha os campos corretamente";
                            });
                          }

                          larguraP2 =
                              double.tryParse(_controllerLarguraP2.text)!;

                          if (alturaP2 * larguraP2 < 1 ||
                              alturaP2 * larguraP2 > 15 ||
                              alturaP2 < 2.20) {
                            setState(() {
                              _alertaCamposP2 = "";
                              alertaDimenP2 = true;
                              portasJanelasP2 = false;
                            });
                          } else {
                            totalParede2 = alturaP2 * larguraP2;
                            setState(() {
                              alertaDimenP2 = false;
                              portasJanelasP2 = true;
                              _alertaCamposP2 = "Área total: $totalParede2 m²";
                            });
                          }
                        },
                      ),
                    ),
                    Visibility(
                      visible: portasJanelasP2,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Deseja adicionar algo?",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  if (qtdPorta2 == 0) {
                                    setState(() {
                                      alertaPorta2 = false;
                                    });
                                  } else if (qtdPorta2 > 0) {
                                    setState(() {
                                      totalParede2 = totalParede2 + portaDimen;
                                      qtdPorta2--;
                                      _alertaCamposP2 =
                                          "Área total: $totalParede2 m²";
                                    });
                                  }
                                },
                              ),
                              const Text(
                                'Porta ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '[$qtdPorta2]',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  if (totalParede2 / 2 < portaDimen) {
                                    setState(() {
                                      alertaPorta2 = true;
                                    });
                                  } else {
                                    setState(() {
                                      totalParede2 = totalParede2 - portaDimen;
                                      qtdPorta2++;
                                      _alertaCamposP2 =
                                          "Área total: $totalParede2 m²";
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          const Text("2.40m²"),
                          const Divider(color: Colors.white),
                          Visibility(
                            visible: alertaPorta2,
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: _cardAlertaDeDimensoes(
                                  "Espaço insuficiente!",
                                  "Item ocupa mais de 50% do espaço total",
                                  16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  if (qtdJanela2 == 0) {
                                    setState(() {
                                      alertaJanela2 = false;
                                    });
                                  } else if (qtdJanela2 > 0) {
                                    setState(() {
                                      totalParede2 = totalParede2 + janelaDimen;
                                      qtdJanela2--;
                                      _alertaCamposP2 =
                                          "Área total: $totalParede2 m²";
                                    });
                                  }
                                },
                              ),
                              const Text(
                                'Janela ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '[$qtdJanela2]',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  if (totalParede2 / 2 < janelaDimen) {
                                    setState(() {
                                      alertaJanela2 = true;
                                    });
                                  } else {
                                    setState(() {
                                      totalParede2 = totalParede2 - janelaDimen;
                                      qtdJanela2++;
                                      _alertaCamposP2 =
                                          "Área total: $totalParede2 m²";
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          const Text("1.52m²"),
                          const Divider(color: Colors.white),
                          Visibility(
                            visible: alertaJanela2,
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: _cardAlertaDeDimensoes(
                                  "Espaço insuficiente!",
                                  "Item ocupa mais de 50% do espaço total",
                                  16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _alertaCamposP2,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
                    const Text(
                      "Parede 3",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Visibility(
                      visible: alertaDimenP3,
                      child: SizedBox(
                        width: 250,
                        height: 60,
                        child: _cardAlertaDeDimensoes(
                            "Tamanho minimo 1m²", "Tamanho máximo 15m²", 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura (mínima 2.20)",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15))),
                        style: const TextStyle(fontSize: 22),
                        controller: _controllerAlturaP3,
                        onChanged: (text) {
                          if (_controllerAlturaP3.text.isEmpty ||
                              _controllerAlturaP3.text == "") {
                            setState(() {
                              alturaP3 = 0;
                              portasJanelasP3 = false;
                              qtdJanela3 = 0;
                              qdtPorta3 = 0;
                              alertaJanela3 = false;
                              alertaPorta3 = false;
                              _alertaCamposP3 =
                                  "Por favor, preencha os campos corretamente";
                            });
                          }

                          alturaP3 = double.tryParse(_controllerAlturaP3.text)!;

                          if (alturaP3 * larguraP3 < 1 ||
                              alturaP3 * larguraP3 > 15 ||
                              alturaP3 < 2.20) {
                            setState(() {
                              _alertaCamposP3 = "";
                              alertaDimenP3 = true;
                              portasJanelasP3 = false;
                            });
                          } else {
                            totalParede3 = alturaP3 * larguraP3;
                            setState(() {
                              alertaDimenP3 = false;
                              portasJanelasP3 = true;
                              _alertaCamposP3 = "Área total: $totalParede3 m²";
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Largura",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15))),
                        style: const TextStyle(fontSize: 22),
                        controller: _controllerLarguraP3,
                        onChanged: (text) {
                          if (_controllerLarguraP3.text.isEmpty ||
                              _controllerLarguraP3.text == "") {
                            setState(() {
                              larguraP3 = 0;
                              portasJanelasP3 = false;
                              qtdJanela3 = 0;
                              qdtPorta3 = 0;
                              alertaJanela3 = false;
                              alertaPorta3 = false;
                              _alertaCamposP3 =
                                  "Por favor, preencha os campos corretamente";
                            });
                          }

                          larguraP3 =
                              double.tryParse(_controllerLarguraP3.text)!;

                          if (alturaP3 * larguraP3 < 1 ||
                              alturaP3 * larguraP3 > 15 ||
                              alturaP3 < 2.20) {
                            setState(() {
                              _alertaCamposP3 = "";
                              alertaDimenP3 = true;
                              portasJanelasP3 = false;
                            });
                          } else {
                            totalParede3 = alturaP3 * larguraP3;
                            setState(() {
                              alertaDimenP3 = false;
                              portasJanelasP3 = true;
                              _alertaCamposP3 = "Área total: $totalParede3 m²";
                            });
                          }
                        },
                      ),
                    ),
                    Visibility(
                      visible: portasJanelasP3,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Deseja adicionar algo?",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  if (qdtPorta3 == 0) {
                                    setState(() {
                                      alertaPorta3 = false;
                                    });
                                  } else if (qdtPorta3 > 0) {
                                    setState(() {
                                      totalParede3 = totalParede3 + portaDimen;
                                      qdtPorta3--;
                                      _alertaCamposP3 =
                                          "Área total: $totalParede3 m²";
                                    });
                                  }
                                },
                              ),
                              const Text(
                                'Porta ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '[$qdtPorta3]',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  if (totalParede3 / 2 < portaDimen) {
                                    setState(() {
                                      alertaPorta3 = true;
                                    });
                                  } else {
                                    setState(() {
                                      totalParede3 = totalParede3 - portaDimen;
                                      qdtPorta3++;
                                      _alertaCamposP3 =
                                          "Área total: $totalParede3 m²";
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          const Text("2.40m²"),
                          const Divider(color: Colors.white),
                          Visibility(
                            visible: alertaPorta3,
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: _cardAlertaDeDimensoes(
                                  "Espaço insuficiente!",
                                  "Item ocupa mais de 50% do espaço total",
                                  16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  if (qtdJanela3 == 0) {
                                    setState(() {
                                      alertaJanela3 = false;
                                    });
                                  } else if (qtdJanela3 > 0) {
                                    setState(() {
                                      totalParede3 = totalParede3 + janelaDimen;
                                      qtdJanela3--;
                                      _alertaCamposP3 =
                                          "Área total: $totalParede3 m²";
                                    });
                                  }
                                },
                              ),
                              const Text(
                                'Janela ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '[$qtdJanela3]',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  if (totalParede3 / 2 < janelaDimen) {
                                    setState(() {
                                      alertaJanela3 = true;
                                    });
                                  } else {
                                    setState(() {
                                      totalParede3 = totalParede3 - janelaDimen;
                                      qtdJanela3++;
                                      _alertaCamposP3 =
                                          "Área total: $totalParede3 m²";
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          const Text("1.52m²"),
                          const Divider(color: Colors.white),
                          Visibility(
                            visible: alertaJanela3,
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: _cardAlertaDeDimensoes(
                                  "Espaço insuficiente!",
                                  "Item ocupa mais de 50% do espaço total",
                                  16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _alertaCamposP3,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
                    const Text(
                      "Parede 4",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Visibility(
                      visible: alertaDimenP4,
                      child: SizedBox(
                        width: 250,
                        height: 60,
                        child: _cardAlertaDeDimensoes(
                            "Tamanho minimo 1m²", "Tamanho máximo 15m²", 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura (mínima 2.20)",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15))),
                        style: const TextStyle(fontSize: 22),
                        controller: _controllerAlturaP4,
                        onChanged: (text) {
                          if (_controllerAlturaP4.text.isEmpty ||
                              _controllerAlturaP4.text == "") {
                            setState(() {
                              alturaP4 = 0;
                              portasJanelasP4 = false;
                              qtdJanela4 = 0;
                              qtdPorta4 = 0;
                              alertaJanela4 = false;
                              alertaPorta4 = false;
                              _alertaCamposP4 =
                                  "Por favor, preencha os campos corretamente";
                            });
                          }

                          alturaP4 = double.tryParse(_controllerAlturaP4.text)!;

                          if (alturaP4 * larguraP4 < 1 ||
                              alturaP4 * larguraP4 > 15 ||
                              alturaP4 < 2.20) {
                            setState(() {
                              _alertaCamposP4 = "";
                              alertaDimenP4 = true;
                              portasJanelasP4 = false;
                            });
                          } else {
                            totalParede4 = alturaP4 * larguraP4;
                            setState(() {
                              alertaDimenP4 = false;
                              portasJanelasP4 = true;
                              _alertaCamposP4 = "Área total: $totalParede4 m²";
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Largura",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(15))),
                        style: const TextStyle(fontSize: 22),
                        controller: _controllerLarguraP4,
                        onChanged: (text) {
                          if (_controllerLarguraP4.text.isEmpty ||
                              _controllerLarguraP4.text == "") {
                            setState(() {
                              larguraP4 = 0;
                              portasJanelasP4 = false;
                              qtdJanela4 = 0;
                              qtdPorta4 = 0;
                              alertaJanela4 = false;
                              alertaPorta4 = false;
                              _alertaCamposP4 =
                                  "Por favor, preencha os campos corretamente";
                            });
                          }

                          larguraP4 =
                              double.tryParse(_controllerLarguraP4.text)!;

                          if (alturaP4 * larguraP4 < 1 ||
                              alturaP4 * larguraP4 > 15 ||
                              alturaP4 < 2.20) {
                            setState(() {
                              _alertaCamposP4 = "";
                              alertaDimenP4 = true;
                              portasJanelasP4 = false;
                            });
                          } else {
                            totalParede4 = alturaP4 * larguraP4;
                            setState(() {
                              alertaDimenP4 = false;
                              portasJanelasP4 = true;
                              _alertaCamposP4 = "Área total: $totalParede4 m²";
                            });
                          }
                        },
                      ),
                    ),
                    Visibility(
                      visible: portasJanelasP4,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Deseja adicionar algo?",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  if (qtdPorta4 == 0) {
                                    setState(() {
                                      alertaPorta4 = false;
                                    });
                                  } else if (qtdPorta4 > 0) {
                                    setState(() {
                                      totalParede4 = totalParede4 + portaDimen;
                                      qtdPorta4--;
                                      _alertaCamposP4 =
                                          "Área total: $totalParede4 m²";
                                    });
                                  }
                                },
                              ),
                              const Text(
                                'Porta ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '[$qtdPorta4]',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  if (totalParede4 / 2 < portaDimen) {
                                    setState(() {
                                      alertaPorta4 = true;
                                    });
                                  } else {
                                    setState(() {
                                      totalParede4 = totalParede4 - portaDimen;
                                      qtdPorta4++;
                                      _alertaCamposP4 =
                                          "Área total: $totalParede4 m²";
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          const Text("2.40m²"),
                          const Divider(color: Colors.white),
                          Visibility(
                            visible: alertaPorta4,
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: _cardAlertaDeDimensoes(
                                  "Espaço insuficiente!",
                                  "Item ocupa mais de 50% do espaço total",
                                  16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  if (qtdJanela4 == 0) {
                                    setState(() {
                                      alertaJanela4 = false;
                                    });
                                  } else if (qtdJanela4 > 0) {
                                    setState(() {
                                      totalParede4 = totalParede4 + janelaDimen;
                                      qtdJanela4--;
                                      _alertaCamposP4 =
                                          "Área total: $totalParede4 m²";
                                    });
                                  }
                                },
                              ),
                              const Text(
                                'Janela ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                '[$qtdJanela4]',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () {
                                  if (totalParede4 / 2 < janelaDimen) {
                                    setState(() {
                                      alertaJanela4 = true;
                                    });
                                  } else {
                                    setState(() {
                                      totalParede4 = totalParede4 - janelaDimen;
                                      qtdJanela4++;
                                      _alertaCamposP4 =
                                          "Área total: $totalParede4 m²";
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          const Text("1.52m²"),
                          const Divider(color: Colors.white),
                          Visibility(
                            visible: alertaJanela4,
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: _cardAlertaDeDimensoes(
                                  "Espaço insuficiente!",
                                  "Item ocupa mais de 50% do espaço total",
                                  16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _alertaCamposP4,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 15),
              child: Visibility(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calcular();

                      showDialog(
                          context: context,
                          builder: (buildContext) {
                            return AlertDialog(
                              scrollable: true,
                              title: Text(
                                "Você precisa de $litrosParaTexto Litros \n"
                                "para pintar $paredesTotalFinal m² \n"
                                "Suas opções para compra são : ",
                                textAlign: TextAlign.center,
                              ),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Visibility(
                                    visible: qtdLatasXG > 0 ? true : false,
                                    child: _paddingOpcoesDeTinta(
                                        qtdLatasXG, "Latas de 18 L"),
                                  ),
                                  Visibility(
                                    visible: qtdLatasG > 0 ? true : false,
                                    child: _paddingOpcoesDeTinta(
                                        qtdLatasG, "Latas de 3,6 L"),
                                  ),
                                  Visibility(
                                    visible: qtdLatasM > 0 ? true : false,
                                    child: _paddingOpcoesDeTinta(
                                        qtdLatasM, "Latas de 2,5 L"),
                                  ),
                                  Visibility(
                                    visible: qtdLatasP > 0 ? true : false,
                                    child: _paddingOpcoesDeTinta(
                                        qtdLatasP, "Latas de 0,5 L"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "Ok",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.amberAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        elevation: 2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// FUNÇÕES

// Cria os Cards de ALERTA para o usuário caso não atenda as dimensões
Widget _cardAlertaDeDimensoes(String text1, String text2, double size) {
  return Card(
    color: Colors.redAccent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: size),
          textAlign: TextAlign.center,
        ),
        Text(
          text2,
          style: TextStyle(fontSize: size),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

//Cria o layout final com as possíveis opções de tinta
Widget _paddingOpcoesDeTinta(int quantidade, String texto) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/lata_tinta.png",
          height: 60,
        ),
        Text(
          "$quantidade  $texto",
          style: const TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
  );
}
