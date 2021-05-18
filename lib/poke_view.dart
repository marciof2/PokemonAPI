import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokemon/poke_controller.dart';
import 'package:pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final viewModel = PokeViewModel();
  MainAxisAlignment alignment = MainAxisAlignment.spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.blue[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<Pokemon>(
                stream: viewModel.streamController.stream,
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      width: 150,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return Stack(children: [
                      Opacity(
                        opacity: 0.2,
                        child: Image.asset('images/pokeball.png'),
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Central Kalos Pokedex',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                snapshot.data.photo,
                                width: 150,
                                height: 150,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Divider(
                                      color: Colors.white54,
                                      height: 10,
                                      thickness: 1,
                                    ),
                                    CustomRow(
                                      'Nº ${snapshot.data.id}',
                                      snapshot.data.nome,
                                    ),
                                    Divider(
                                      color: Colors.white54,
                                      height: 10,
                                      thickness: 1,
                                    ),
                                    CustomRow(
                                      '${snapshot.data.tipo}',
                                      'Tipo ',
                                    ),
                                    Divider(
                                      color: Colors.white54,
                                      height: 10,
                                      thickness: 1,
                                    ),
                                    CustomRow(
                                        '${snapshot.data.tamanho}', 'Tamanho'),
                                    Divider(
                                      color: Colors.white54,
                                      height: 10,
                                      thickness: 1,
                                    ),
                                    CustomRow(
                                        '${snapshot.data.peso} lbs.', 'Peso '),
                                    Divider(
                                      color: Colors.white54,
                                      thickness: 1,
                                    ),
                                    Text(
                                      'Habilidades',
                                      style: TextStyle(
                                          decorationThickness: 3,
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      height: 100,
                                      width: 260,
                                      child: ListView.builder(
                                        itemCount:
                                            snapshot.data.abilities.length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                            snapshot.data.abilities[index].name,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]);
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error,
                    );
                  }
                },
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        viewModel.loadPokemon();
                      });
                    },
                    child: Text(
                      'Load Pokemon',
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final String status;
  final String dado;
  final linha;

  // ignore: non_constant_identifier_names
  CustomRow(this.status, this.dado, {Key, key, this.linha}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dado,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          status,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
