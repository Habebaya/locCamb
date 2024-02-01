import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loccamb/core/constant/app_color.dart';
import 'package:loccamb/module/home/presentation/controller/home_bloc.dart';
import 'package:loccamb/module/home/presentation/widget/user_tile.dart';

import '../../../../core/constant/request_state.dart';
import '../../../../core/services/services_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title:  Text("Users"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          surfaceTintColor: Colors.white,
        ),
        body: BlocProvider(
          create: (context) =>
          HomeBloc(sl())..add(GetUserEvent()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              switch (state.getUsersState) {
                case RequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestState.loaded:
                  if (state.users!.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,

                      itemBuilder: (context, index) {
                        return  UserTile( user: state.users[index],);
                      },
                      itemCount: state.users.length,

                    );
                  } else {
                    return const Text("empty");
                  }

                case RequestState.error:
                  return const Text("error");
              }
            },
          ),
        ));
  }
}
