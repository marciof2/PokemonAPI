import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokemon/poke_controller.dart';
import 'package:pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();
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
              FutureBuilder<Pokemon>(
                future: controller.pokemon,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
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
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue[200],
                            Colors.blue[300],
                            Colors.blue[600]
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Central Kalos Pokedex',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error,
                    );
                  }
                },
              ),
              Column(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        controller.loadPokemon();
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

  CustomRow(this.status, this.dado, {Key, key, this.linha}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dado,
          style: TextStyle(
              fontSize: 20,
              color: Colors.blue[900],
              fontWeight: FontWeight.w600),
        ),
        Text(
          status,
          style: TextStyle(
              fontSize: 20,
              color: Colors.blue[900],
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.53;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0008333, size.height * 0.4985714);
    path_0.quadraticBezierTo(size.width * 0.0008333, size.height * 0.4932143,
        size.width * 0.0008333, size.height * 0.4914286);
    path_0.quadraticBezierTo(size.width * -0.0095833, size.height * 0.2078571,
        size.width * 0.1191667, size.height * 0.2200000);
    path_0.lineTo(size.width * 0.1141667, size.height * 0.2214286);
    path_0.lineTo(size.width * 0.5058333, size.height * 0.2142857);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
