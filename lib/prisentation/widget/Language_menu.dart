import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Language_menu extends StatelessWidget {
  const Language_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<AppLanguage>(
      value: AppLanguage.en,
        onChanged:(val ){

        },
        items:List.generate(AppLanguage.values.length, (index) {
          return DropdownMenuItem(
              value: AppLanguage.values[index],
              child: Text(AppLanguage.values[index].getLangName));
        }) ,
       );
  }
}
extension LanguageHandler on AppLanguage{
  String get getLangName{
    switch (this){
      case AppLanguage.ar:
        return"العربيه" ;
      case AppLanguage.en:
        return "English" ;

    }
  }
}
enum AppLanguage{
  ar ,
  en
}