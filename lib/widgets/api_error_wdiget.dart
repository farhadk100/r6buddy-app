import 'package:flutter/material.dart';

import '../../main.dart';

class ErrorScreen extends StatefulWidget {
  final Function callBack;
  ErrorScreen({required this.callBack});
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            child: Icon(Icons.error, color: Colors.red, size: 150,),
          ),
          Text(
            'Something went wrong'
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
              child: Text(
                'Try again'
              ),
              onPressed: (){
                widget.callBack();
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
              ),
            ),
          )
        ],
      ),
    );
  }
}
