

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:r6buddy/maps/operator_map.dart';

class OperatorPortraitCard extends StatelessWidget {
  final Operator operator;
  final Function(Operator operator) goToOperator;
  const OperatorPortraitCard(this.operator, this.goToOperator, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 65, 83, 128),
                Color.fromARGB(255, 33, 46, 80),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            // image: DecorationImage(
            //   image: AssetImage('assets/images/r6-logo.jpg'),
            //   alignment: Alignment.center,
            //   fit: BoxFit.cover,
            //   colorFilter: ColorFilter.mode(Color.fromARGB(255, 33, 46, 80).withOpacity(0.5), BlendMode.darken),
            // )
          ),
          child: Hero(
            tag: operator.key,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(operator.portraitUrl),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () => goToOperator(operator),
                  splashColor: Colors.white30,
                  highlightColor: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white24,
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: operator.key + 'Icon',
                    child: CachedNetworkImage(
                      imageUrl: operator.iconUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Hero(
                      tag: operator.key + 'Name',
                      child: Text(
                        operator.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(1, 1),
                            ),
                            Shadow(
                              blurRadius: 3,
                              color: Colors.black,
                              offset: Offset(-1, -1),
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
