import 'package:flutter/material.dart';

class CardPokemon extends StatelessWidget {
  final String? name;
  final String? url;
  final Function() onChanged;

  const CardPokemon(
      {super.key,
      required this.name,
      required this.url,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 120,
              padding: const EdgeInsets.only(left: 10, top: 20),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 4,
                    offset: const Offset(2, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Container(
                    width: 60,
                    height: 20,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Pokemon',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1.9, 2.5),
            child: Image.network('$url', width: 120, height: 120,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Align(
                  alignment: Alignment(0.9, 0.6),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(color: Colors.white),
                  ));
            }, errorBuilder: (context, error, stackTrace) {
              return Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                width: 120,
                height: 120,
              );
            }),
          )
        ],
      )),
    );
  }
}
