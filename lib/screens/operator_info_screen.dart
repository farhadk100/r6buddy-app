import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/providers/operator_info_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:r6buddy/widgets/gadget/gadget_card.dart';
import 'package:r6buddy/widgets/weapon/weapon_card.dart';

class OperatorInfoScreen extends StatelessWidget {
  const OperatorInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OperatorInfoProvider>(
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => model.goBack(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 15.0),
                              child:  FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white,),
                            ),
                            Hero(
                              tag: model.operator.key + 'Name',
                              child: Text(
                                model.operator.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.shade800.withAlpha(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Hero(
                                  tag: model.operator.key,
                                  child: CachedNetworkImage(
                                    imageUrl: model.operator.portraitUrl,
                                    width: 180,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag: model.operator.key + 'Icon',
                                          child: CachedNetworkImage(
                                            imageUrl: model.operator.iconUrl,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          model.operator.bio.realName,
                                          style: Theme.of(context).textTheme.titleLarge,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Birthdate',
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      model.operator.bio.dateOfBirth!,
                                      style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey.shade300),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Birthplace',
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      model.operator.bio.placeOfBirth!,
                                      style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey.shade300),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Primary Weapons',
                        style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.operator.loadout.primaryWeapons.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: WeaponCard(model.operator.loadout.primaryWeapons[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Secondary Weapons',
                        style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.operator.loadout.secondaryWeapons.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: WeaponCard(model.operator.loadout.secondaryWeapons[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gadgets',
                        style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.operator.loadout.gadgets.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GadgetCard(model.operator.loadout.gadgets[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        model.operator.bio.bio ?? '',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey.shade300, fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ),
          ),
        );
      },
    );
  }
}
