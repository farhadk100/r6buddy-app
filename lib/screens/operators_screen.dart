import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/providers/operators_provider.dart';
import 'package:r6buddy/utilities/connection_state.dart';
import 'package:r6buddy/widgets/api_error_wdiget.dart';

class OperatorsScreen extends StatelessWidget {
  const OperatorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OperatorsProvider>(
        builder: (context, model, child){
          if (model.loadStatus == LoadStatus.loading){
            return const Center(child: CircularProgressIndicator());
          } else if (model.loadStatus == LoadStatus.error){
            return ErrorScreen(callBack: model.getOperators);
          } else {
            return operators(model);
          }
        },
      ),
    );
  }

  Widget operators(OperatorsProvider model){
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index){
        return ListTile(
          leading: CachedNetworkImage(imageUrl: model.operators[0].iconUrl, width: 60,),
          title: Text(model.operators[0].name!),
          subtitle: Text(model.operators[0].bio.realName),
          trailing: Container(
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text('Speed'),
                    for (var i = 0; i < 3; i++)
                      i < model.operators[0].speed ?
                        Icon(Icons.star, color: Colors.yellow,)
                          : Icon(Icons.star_border, color: Colors.yellow,)
                  ],
                ),
                Row(
                  children: [
                    Text('Armor'),
                    for (var i = 0; i < 3; i++)
                      i < model.operators[0].armor ?
                      Icon(Icons.star, color: Colors.yellow,)
                          : Icon(Icons.star_border, color: Colors.yellow,)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
