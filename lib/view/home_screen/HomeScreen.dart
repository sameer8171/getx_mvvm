import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/Status.dart';
import 'package:getx_mvvm/res/components/TextView.dart';
import 'package:getx_mvvm/res/routes/RoutesName.dart';
import 'package:getx_mvvm/view_model/controller/home/home_view_model.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_prefrence_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  final homeViewModel = Get.put(HomeViewModel());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    homeViewModel.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextView(
          textValue: 'Home Screen',
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                userPreference
                    .removeUser()
                    .then((value) => {Get.toNamed(RouteName.loginScreen)});
              },
              icon: const Icon(Icons.logout))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Obx(() {
        switch (homeViewModel.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeViewModel.userList.value.data!.length,
                itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(homeViewModel.userList.value.data![index].avatar.toString()),
                    ),
                    title: TextView(textValue: homeViewModel.userList.value.data![index].firstName.toString(),),
                    subtitle: TextView(textValue: homeViewModel.userList.value.data![index].email.toString()),
                  ),
                );
            });
          case Status.ERROR:
            return  Center(
                child: Text(homeViewModel.error.toString()));
        }
      }),
    );
  }
}
