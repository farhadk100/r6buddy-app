import 'package:flutter/material.dart';
import 'package:r6buddy/maps/operator_map.dart';

class OperatorInfoProvider extends ChangeNotifier{

  Operator _operator;
  BuildContext _context;

  OperatorInfoProvider(this._context, this._operator);

  Operator get operator => _operator;

  goBack(){
    Navigator.pop(_context);
  }

}