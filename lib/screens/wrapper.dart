import 'package:LoginSample/models/User.dart';
import 'package:LoginSample/screens/auth/authenticate.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final user = Provider.of<LocalUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home(
        user: user,
      );
    }
  }
}
