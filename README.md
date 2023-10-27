## flexi_cart_updater

Easily manage cart icon with badge all over the eCommerce application & just update & display by calling a single line code.

<table>
   <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_cart_updater/master/assets/screenshot1.png">
      </td>
    </tr>
</table>

## Features

- Just defined values once in app
- display cart icon wherever want to display with just a single line
- increase & decrease cart value easily & it reflects all over the app

## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  flexiCart_updater: ^1.0.4
```

## Usage

```dart

1. Initialize only once in main file

  - if you want to assign material color directly then write code inside main file or in initstate method :

        void main() async {

                    FlexiCart.initFlexiCart(
                    child: const Icon(Icons.shopping_cart_outlined,size: 25,color: Colors.black54,),
                    cartCount: 2,
                    cartBadgeTextColor: Colors.white,
                    cartBadgeBackgroundColor: Colors.blueAccent);
            
            runApp(  ...

2. Display cart widget

                    AppBar(
                    // Here we take the value from the MyHomePage object that was created by
                    // the App.build method, and use it to set our appbar title.
                    title: Text(widget.title),
                    actions: [
                            
                            Icon(Icons.search,size: 25,color: Colors.black54,),
                            
                            FlexiCart.cart(onTap: (){
                            print("Navigate to your cart screen here");
                            }),                   
                             ...
     
3. For increase cart value

            FlexiCart.add();

4. For decrease cart value

            FlexiCart.remove();


5. Update cart value as per your convenient

            FlexiCart.clear();

6. For clear cart value

            FlexiCart.update(newCartCount: 4);

```