import 'package:LoginSample/models/user.dart';
import 'package:LoginSample/screens/authenticate/authenticate.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double blockHeight = SizeConfig.safeBlockVertical;
    double blockWidth = SizeConfig.safeBlockHorizontal;
    final user = Provider.of<LocalUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home(user);
    }
  }
}
