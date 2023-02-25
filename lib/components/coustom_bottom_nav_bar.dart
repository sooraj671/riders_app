

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riders_app/screens/home/home_screen.dart';



import '../api/OrdersService.dart';
import '../constants.dart';
import '../enums.dart';
import '../screens/nearby/components/current_location_screen.dart';
import '../screens/welcome/welcome_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/locate.svg",
                  color: MenuState.locate == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed:() {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return  CurrentLocationScreen();
              }));
              },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/orders.svg",
                color: MenuState.orders == selectedMenu?
                kPrimaryColor
                    : inActiveIconColor,
              ),
                onPressed: () async {

                  // if(await getPendingOrders() &&
                  // await getCompletedOrders()){
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) =>  ManageSales()));
                  // }

                }
              ),

              // IconButton(
              //   icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg",
              //     color: MenuState.chat == selectedMenu?
              //     kPrimaryColor
              //         : inActiveIconColor,
              //   ),
              //     onPressed: () =>
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => const ChatsScreen()),
              //       ),
              // ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile ==   selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {}
                    // Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
