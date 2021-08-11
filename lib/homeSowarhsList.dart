import 'package:flutter/material.dart';

import 'sowarListPage.dart';

class HomeSowrahsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SurahsList.routeName,
     // onGenerateRoute: (route)=>getRoute(route),
    );
  }

  // Route getRoute(RouteSettings route)
  // {
  //   SowrhContentArguments args = route.arguments;
  //   return buildRoute(sowerContent(args), settings: route);
  // }
  // MaterialPageRoute buildRoute(Widget child, {RouteSettings settings})
  // {
  //   MaterialPageRoute(
  //     settings: settings,
  //     builder: (BuildContext context)=>child,
  //   );
  // }
}
