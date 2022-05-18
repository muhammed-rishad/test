

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget sampleCard(BuildContext context,{required String title,required String body}){
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(10)
    ),
    height: MediaQuery.of(context).size.height/3,
    width: MediaQuery.of(context).size.width/1.3,
    child: Column(
      children: [
        Expanded(
            flex: 2,
            child: Text(title,style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
            )),
        Expanded(
            flex: 7,
            child: Text(body,
            )),

      ],
    ),
  );
}