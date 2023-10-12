import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:session_2/prisentation/widget/Language_menu.dart';
import 'package:session_2/cubit/them_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../utils/routing_constants.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return   Scaffold(
      body:SafeArea(child:Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const _BuildText(),
              const SizedBox(height: 10,),
              const Language_menu(),
              const SizedBox(height: 150,),
              
              BlocBuilder<ThemCubit , bool>(
                  builder: ( context, state) {
                    return  SwitchListTile(
                        value: state,
                      title: Text("toggle Theme"), onChanged: (value) {
                          BlocProvider.of<ThemCubit>(context).toggleThem(value: value);
                    });

                  },
                  
        ),
              const SizedBox(height: 150,),
              SizedBox(
                width: 50.w,
                child: FilledButton(
                  onPressed: () => context.push(news),
                  child: Text(
                    "nada",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              )
             

            ],) ,


      ), )


    );
  }
}


class _BuildText extends StatelessWidget {
  const _BuildText();

  @override
  Widget build(BuildContext context) {
    return Text(
        AppLocalizations.of(context)!.helloMessage("nada")
        , style: const TextStyle(
        fontSize: 40 ,
    ));
  }
}
