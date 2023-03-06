import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

ValueNotifier<flexi_cart_controller> value_flexi_cart_controller = ValueNotifier<flexi_cart_controller>(flexi_cart_controller());

class flexi_cart extends StatelessWidget {

  static flexi_cart? _instance;
  flexi_cart._();
  static flexi_cart get instance => _instance ??= flexi_cart._();

  initialize({required Icon? flexi_cart_icon,
      required Color? flexi_badge_background,
      required Color? flexi_badge_foreground,
      required int? flexi_cart_count}){

    value_flexi_cart_controller.value.flexi_cart_icon = flexi_cart_icon;
    value_flexi_cart_controller.value.flexi_badge_background = flexi_badge_background;
    value_flexi_cart_controller.value.flexi_badge_foreground = flexi_badge_foreground;
    value_flexi_cart_controller.value.flexi_cart_count = flexi_cart_count;

    value_flexi_cart_controller.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: 5,right: 10),
      child: Container(

          child:

          ValueListenableBuilder(
            valueListenable: value_flexi_cart_controller,
            builder: (context, varCartValue, child) {
              return value_flexi_cart_controller.value.flexi_cart_count == 0 ?

                _buildCart()

                    :

                badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: value_flexi_cart_controller.value.flexi_badge_background!,
                    ),
                    position: BadgePosition.topEnd(),//topStart(start: 16,),
                    badgeContent:
                    SizedBox(
                        width: 15, height: 15, //badge size
                        child:Center(  //aligh badge content to center
                            child:
                            FittedBox(
                              fit: BoxFit.contain,
                              child:  Text("${value_flexi_cart_controller.value.flexi_cart_count}", style: TextStyle(
                                color: value_flexi_cart_controller.value.flexi_badge_foreground,  //badge font color
                                //fontSize: 13 //badge font size
                              )
                              ),
                            )
                        )
                    ),
                    child: _buildCart()
                );
            },
          ),

      ),
    );
  }

  Widget _buildCart(){

    return Container(
        height: 35,width: 35,
        // alignment: Alignment.center,
        child: value_flexi_cart_controller.value.flexi_cart_icon
    );
  }

  Widget cart({required Function onTap}){

   return Padding(
      padding: EdgeInsets.only(left: 5,right: 10),
      child: InkWell(
        onTap: (){

        },
        child: ValueListenableBuilder(
          valueListenable: value_flexi_cart_controller,
          builder: (context, varCartValue, child) {
            return value_flexi_cart_controller.value.flexi_cart_count == 0 ?

            _buildCart()

                :

            badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: value_flexi_cart_controller.value.flexi_badge_background!,
                ),
                position: BadgePosition.topEnd(),//topStart(start: 16,),
                badgeContent:
                SizedBox(
                    width: 15, height: 15, //badge size
                    child:Center(  //aligh badge content to center
                        child:
                        FittedBox(
                          fit: BoxFit.contain,
                          child:  Text("${value_flexi_cart_controller.value.flexi_cart_count}", style: TextStyle(
                            color: value_flexi_cart_controller.value.flexi_badge_foreground,  //badge font color
                            //fontSize: 13 //badge font size
                          )
                          ),
                        )
                    )
                ),
                child: _buildCart()
            );
          },
        ),
      ),
    );

  }

  void add(){
    value_flexi_cart_controller.value.flexi_cart_count  =  value_flexi_cart_controller.value.flexi_cart_count! + 1;
    value_flexi_cart_controller.notifyListeners();
  }

  void remove(){
    if(value_flexi_cart_controller.value.flexi_cart_count! > 0) {
      value_flexi_cart_controller.value.flexi_cart_count = value_flexi_cart_controller.value.flexi_cart_count! - 1;
      value_flexi_cart_controller.notifyListeners();
    }
  }

  void update({required int newCartCount}){
    value_flexi_cart_controller.value.flexi_cart_count  = newCartCount;
    value_flexi_cart_controller.notifyListeners();
  }

  void clear(){
    value_flexi_cart_controller.value.flexi_cart_count = 0;
    value_flexi_cart_controller.notifyListeners();
  }
}

class flexi_cart_controller extends ChangeNotifier {

    Icon? flexi_cart_icon = Icon(Icons.shopping_cart_outlined,color: Colors.black,);
  Color? flexi_badge_background = Colors.blue;
  Color? flexi_badge_foreground = Colors.white;
  int? flexi_cart_count = 0;

  flexi_cart_controller({
    this.flexi_cart_icon,
    this.flexi_badge_background,
    this.flexi_badge_foreground,
    this.flexi_cart_count,

    });

}