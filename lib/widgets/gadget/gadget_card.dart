import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:r6buddy/maps/gadget_map.dart';

class GadgetCard extends StatelessWidget {
  final Gadget gadget;
  const GadgetCard(this.gadget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lime.shade700.withAlpha(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: gadget.imageUrl,
                width: 200,
                fit: BoxFit.cover,
              ),
              Container(
                height: 10,
              ),
              Text(
                gadget.name,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
    );
  }
}
