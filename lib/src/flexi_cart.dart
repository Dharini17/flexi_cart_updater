import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

ValueNotifier<flexiCart_controller> valueFlexiCartController = ValueNotifier<flexiCart_controller>(flexiCart_controller());

class flexiCart{//} extends StatelessWidget {

  static flexiCart? _instance;
  flexiCart._();
  static flexiCart get instance => _instance ??= flexiCart._();

  initialize({required Icon? flexiCartIcon,
      required Color? flexiBadgeBackground,
      required Color? flexiBadgeForeground,
      required int? flexiCartCount}){

    valueFlexiCartController.value.flexiCartIcon = flexiCartIcon;
    valueFlexiCartController.value.flexiBadgeBackground = flexiBadgeBackground;
    valueFlexiCartController.value.flexiBadgeForeground = flexiBadgeForeground;
    valueFlexiCartController.value.flexiCartCount = flexiCartCount;

    valueFlexiCartController.notifyListeners();
  }

  Widget _buildCart(){

    return valueFlexiCartController.value.flexiCartIcon!;
  }

  Widget cart({required Function onTap}){

    return

      GestureDetector(
        onTap: (){
          onTap();
        },
        child: ValueListenableBuilder(
            valueListenable: valueFlexiCartController,
            builder: (context, varCartValue, child) {
              return valueFlexiCartController.value.flexiCartCount == 0 ?

              _buildCart() :

              Container(
                alignment: Alignment.center,
                child: badges.Badge(
                  // position: badges.BadgePosition.topEnd(top: -10, end: -12),
                    showBadge: true,
                    ignorePointer: false,
                    onTap: () {

                      onTap();

                    },
                    badgeContent:
                    Text("${valueFlexiCartController.value.flexiCartCount}",
                        style: TextStyle(
                            color: valueFlexiCartController.value
                                .flexiBadgeForeground, //badge font color
                            fontSize: 13 //badge font size
                        )
                    ),

                    badgeStyle: badges.BadgeStyle(
                      badgeColor: valueFlexiCartController.value
                          .flexiBadgeBackground!,
                    ),
                    child: _buildCart()
                ),
              );
            }
        ),
      )
    ;

  }

  void add(){
    valueFlexiCartController.value.flexiCartCount  =  valueFlexiCartController.value.flexiCartCount! + 1;
    valueFlexiCartController.notifyListeners();
  }

  void remove(){
    if(valueFlexiCartController.value.flexiCartCount! > 0) {
      valueFlexiCartController.value.flexiCartCount = valueFlexiCartController.value.flexiCartCount! - 1;
      valueFlexiCartController.notifyListeners();
    }
  }

  void update({required int newCartCount}){
    valueFlexiCartController.value.flexiCartCount  = newCartCount;
    valueFlexiCartController.notifyListeners();
  }

  void clear(){
    valueFlexiCartController.value.flexiCartCount = 0;
    valueFlexiCartController.notifyListeners();
  }

}

class flexiCart_controller extends ChangeNotifier {

  Icon? flexiCartIcon = Icon(Icons.shopping_cart_outlined,color: Colors.black,);
  Color? flexiBadgeBackground = Colors.blue;
  Color? flexiBadgeForeground = Colors.white;
  int? flexiCartCount = 0;

  flexiCart_controller({
    this.flexiCartIcon,
    this.flexiBadgeBackground,
    this.flexiBadgeForeground,
    this.flexiCartCount,

    });

}