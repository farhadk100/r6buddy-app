import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/providers/operators_provider.dart';
import 'package:r6buddy/utilities/connection_state.dart';
import 'package:r6buddy/widgets/api_error_wdiget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:r6buddy/widgets/operator/operator_portrait_card.dart';
import 'package:r6buddy/widgets/operator/operator_side_selector.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.imagePortrait),
            label: 'Operators',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bomb),
            label: 'Gadgets',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.gun),
            label: 'Guns',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.map),
            label: 'Maps',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        backgroundColor: const Color.fromARGB(255, 15, 33, 80),
        selectedItemColor: Colors.blue.shade100,
        unselectedItemColor: Colors.blue.shade800,
        onTap: (index){
          if (index == 0){
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          }
        },
      ),
    );
  }

  Widget operators(OperatorsProvider model){
    //return an sliver with one text on top and a gridview builder
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButtons(
                      children: const [
                        OperatorSideSelector(),
                        OperatorSideSelector(isAttacker: false),
                      ],
                    isSelected: [model.showAttackers, !model.showAttackers],
                    selectedColor: Colors.blue.shade100,
                    disabledBorderColor: Colors.blue.shade800,
                    onPressed: (_selected) => model.showAttackers = !model.showAttackers,
                    borderColor: Colors.blue.shade800,
                    selectedBorderColor: Colors.blue.shade100,
                    disabledColor: Colors.blue.shade800,
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(8),
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: SliverGrid.extent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.7,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 10.0,
            children: model.operators.map((operator) => OperatorPortraitCard(operator)).toList(),
          ),
        ),
      ],
    );
  }
}
