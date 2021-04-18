import 'package:flutter/material.dart';
import 'package:pokemon/poke_controller.dart';
import 'package:pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Pokemon>(
            future: controller.pokemon,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Image.network(snapshot.data.photo),
                    Text(snapshot.data.nome),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(
                  snapshot.error,
                );
              }
              return Container();
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                controller.loadPokemon();
              });
            },
            child: Text('Load Pokemon'),
          ),
        ],
      ),
    );
  }
}
