

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:r6buddy/maps/operator_map.dart';

class OperatorPortraitCard extends StatelessWidget {
  final Operator operator;
  const OperatorPortraitCard(this.operator, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: CachedNetworkImageProvider(operator.portraitUrl),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Align(
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
                  CachedNetworkImage(
                    imageUrl: operator.iconUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      operator.name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
