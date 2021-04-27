import 'package:flutter/material.dart';

Color starcolorback({@required int stars}) {
  if (stars == 0 || stars == 1)
    return Colors.grey[200];
  else if (stars == 2)
    return Colors.green[200];
  else if (stars == 3)
    return Colors.blue[200];
  else if (stars == 4)
    return Colors.purple[200];
  else if (stars == 5)
    return Colors.yellow[200];
  else if (stars == 6)
    return Colors.orange[200];
  else
    return Colors.red[200];
}

Color starcolor({@required int stars}) {
  if (stars == 0 || stars == 1)
    return Colors.grey;
  else if (stars == 2)
    return Colors.green;
  else if (stars == 3)
    return Colors.blue;
  else if (stars == 4)
    return Colors.purple;
  else if (stars == 5)
    return Colors.yellow[700];
  else if (stars == 6)
    return Colors.orange;
  else
    return Colors.red;
}
