import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/providers/gadgets_provider.dart';
import 'package:r6buddy/providers/main_page_provider.dart';
import 'package:r6buddy/providers/operators_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:r6buddy/providers/weapons_provider.dart';
import 'package:r6buddy/screens/gadgets_screen.dart';
import 'package:r6buddy/screens/operators_screen.dart';
import 'package:r6buddy/screens/weapons_screen.dart';
import 'package:r6buddy/utilities/dio_manager.dart';
import 'package:r6buddy/utilities/enums.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageProvider>(
      builder: (context, model, child){
        return Scaffold(
          body: _getBody(model),
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
            currentIndex: model.currentIndex,
            backgroundColor: const Color.fromARGB(255, 15, 33, 80),
            selectedItemColor: Colors.blue.shade100,
            unselectedItemColor: Colors.blue.shade800,
            onTap: (index){
              model.currentIndex = index;
              switch (index){
                case 0:
                  model.mainPageScreen = MainPageSection.operators;
                  break;
                case 1:
                  model.mainPageScreen = MainPageSection.gadgets;
                  break;
                case 2:
                  model.mainPageScreen = MainPageSection.guns;
                  break;
                default:
                  model.mainPageScreen = MainPageSection.maps;
                  break;
              }
            },
          ),
        );
      },
    );
  }

  Widget _getBody(MainPageProvider model){
    switch (model.mainPageScreen){
      case MainPageSection.operators:
        return ChangeNotifierProvider(create: (context) => OperatorsProvider(context, Provider.of<DioManager>(context, listen: false)), child: const OperatorsScreen());
      case MainPageSection.gadgets:
        return ChangeNotifierProvider(create: (context) => GadgetsProvider(context, Provider.of<DioManager>(context, listen: false)), child: const GadgetScreen());
      case MainPageSection.guns:
        return ChangeNotifierProvider(create: (context) => WeaponsProvider(context, Provider.of<DioManager>(context, listen: false)), child: const WeaponsScreen());
      default:
        return const Center(child: Text('Maps'));
    }
  }
}
