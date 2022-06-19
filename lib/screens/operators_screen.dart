import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/providers/operators_provider.dart';
import 'package:r6buddy/utilities/enums.dart';
import 'package:r6buddy/widgets/api_error_wdiget.dart';
import 'package:r6buddy/widgets/operator/operator_portrait_card.dart';
import 'package:r6buddy/widgets/operator/operator_side_selector.dart';

class OperatorsScreen extends StatelessWidget {
  const OperatorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OperatorsProvider>(
      builder: (context, model, child){
        if (model.loadStatus == LoadStatus.loading){
          return const Center(child: CircularProgressIndicator());
        } else if (model.loadStatus == LoadStatus.error){
          return ErrorScreen(callBack: model.refresh);
        } else {
          return _operators(model);
        }
      }
    );
  }

  Widget _operators(OperatorsProvider model){
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
                children: model.operators.map((operator) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: OperatorPortraitCard(operator, model.goToOperatorPage),
                )).toList(),
              ),
            ),
          ],
        );
    }
}
