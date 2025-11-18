import 'package:ecommerce_app/Features/Home_Feature/manager/CartCubit/Cart_cubit.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/CartView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/profileView.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/widgets/CustomBottomNavBar.dart';
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/HomeView.dart'
    show Homeview;
import 'package:ecommerce_app/Features/Home_Feature/presentation/Views/productsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);
  static const routename = "mainview";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  final List<Widget> screens = [
    Homeview(),
    Productsview(),
    Cartview(),
    Profileview(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CartCubit();
      },
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTabChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: SafeArea(
          child: MainViewBody(screens: screens, currentIndex: currentIndex),
        ),
      ),
    );
  }
}

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.screens,
    required this.currentIndex,
  });

  final List<Widget> screens;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return MainViewBody_BlocBuilder(screens: screens, currentViewIndex: currentIndex);
  }
}

class MainViewBody_BlocBuilder extends StatelessWidget {
  const MainViewBody_BlocBuilder({
    super.key,
    required this.screens,
    required this.currentViewIndex,
  });

  final List<Widget> screens;
  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit,AddProductState>(
        listener: (context, state) {
          if(state is ProductAdded){


            showSnackBar(context,"تم اضافة العنصر بنجاح");

          }
         else if(state is ProductAdded){


            showSnackBar(context,"تم حذف العنصر بنجاح");

          }
        },
        child: IndexedStack(children: screens, index: currentViewIndex));
  }

  ScaffoldMessengerState showSnackBar(BuildContext context,String text) {

    return ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text(text))
            );
  }
}
