import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

ValueNotifier<int> flexiCartCount = ValueNotifier<int>(0);
ValueNotifier<Widget> flexiCartWidget = ValueNotifier<Widget>(const SizedBox());
ValueNotifier<Color> flexiCartCountColor = ValueNotifier<Color>(const Color(0xff000000));
ValueNotifier<Color> flexiCartCountBackgroundColor = ValueNotifier<Color>(const Color(0xff000000));

class FlexiCart{

  static initFlexiCart({
    required Widget child,
    required int cartCount,
    required Color cartBadgeTextColor,
    required Color cartBadgeBackgroundColor,
  }){
    flexiCartCount.value = cartCount;flexiCartCount.notifyListeners();
    flexiCartWidget.value = child;flexiCartWidget.notifyListeners();
    flexiCartCountColor.value = cartBadgeTextColor;flexiCartCountColor.notifyListeners();
    flexiCartCountBackgroundColor.value = cartBadgeBackgroundColor;flexiCartCountBackgroundColor.notifyListeners();
  }

  static Widget cart({required Function onTap}){

    return

      Center(
        child: InkWell(
          onTap:()=>onTap(),
          child:

          Padding(
            padding: const EdgeInsets.all(5),
            child: ValueListenableBuilder(
                valueListenable: flexiCartCount,
                builder: (context, flexiCartCountValue, child) {
                  return

                    flexiCartCountValue == 0 ?
                    flexiCartWidget.value :

                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: badges.Badge(
                          position: badges.BadgePosition.topEnd(top: -12, end: -14),
                        badgeContent: Text('$flexiCartCountValue',style: TextStyle(fontSize: 13,color: flexiCartCountColor.value),),
                        child: flexiCartWidget.value,
                            badgeStyle: badges.BadgeStyle(
                            badgeColor: flexiCartCountBackgroundColor.value,
                            )
                      ),
                    );
                }
            ),
          ),
        ),
      );
  }

  static add(){
    flexiCartCount.value  =  flexiCartCount.value! + 1;
    flexiCartCount.notifyListeners();
  }

  static remove(){
    if(flexiCartCount.value! > 0) {
      flexiCartCount.value = flexiCartCount.value! - 1;
      flexiCartCount.notifyListeners();
    }
  }

  static update({required int newCartCount}){
    flexiCartCount.value  = newCartCount;
    flexiCartCount.notifyListeners();
  }

  static clear(){
    flexiCartCount.value = 0;
    flexiCartCount.notifyListeners();
  }
}
