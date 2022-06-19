import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/providers/weapons_provider.dart';
import 'package:r6buddy/utilities/enums.dart';
import 'package:r6buddy/widgets/api_error_wdiget.dart';
import 'package:r6buddy/widgets/weapon/weapon_card.dart';

class WeaponsScreen extends StatelessWidget {
  const WeaponsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeaponsProvider>(
        builder: (context, model, child){
          if (model.loadStatus == LoadStatus.loading){
            return const Center(child: CircularProgressIndicator());
          } else if (model.loadStatus == LoadStatus.error){
            return ErrorScreen(callBack: model.refresh);
          } else {
            return _gadgets(model);
          }
        }
    );
  }

  Widget _gadgets(WeaponsProvider model){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.7,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            mainAxisExtent: 200,
          ),
          itemCount: model.weapons.length,
          itemBuilder: (context, index) {
            return WeaponCard(model.weapons[index]);
          },
      ),
    );
  }
}
