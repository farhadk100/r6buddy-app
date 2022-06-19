
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:r6buddy/maps/weapon_map.dart';

class WeaponCard extends StatelessWidget {
  final Weapon weapon;
  const WeaponCard(this.weapon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade700.withAlpha(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
                imageUrl: weapon.imageUrl,
              width: 200,
              fit: BoxFit.cover,
            ),
            Container(
              height: 10,
            ),
            Text(
                weapon.name,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Container(
              height: 10,
            ),
            Text(
              '(${weapon.type ?? 'Type Unknown'})',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      )
    );
  }
}
