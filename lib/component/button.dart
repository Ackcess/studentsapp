import 'package:flutter/material.dart';


final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(227, 50),
    primary: Colors.purple[50],
   elevation: 3,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(9))
    )
);

final ButtonStyle buttonOnePrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(117, 50),
    primary: Colors.blue,
    elevation: 3,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(9))
    )
);

final ButtonStyle buttonTPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(157, 50),
    primary: Colors.purple.shade100,
    elevation: 3,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29))
    )
);

final ButtonStyle buttonTwoPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(117, 50),
    primary: Colors.deepPurple,
    elevation: 3,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(9))
    )
);