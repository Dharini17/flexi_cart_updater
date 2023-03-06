## flexi_cart_updater

Easily manage cart icon with badge all over the ecommerce application & just update & display by calling a single line code.

<table>
   <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_cart_updater/master/assets/screenshot1.png">
      </td>   
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_cart_updater/master/assets/screenshot2.png">
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
  flexi_cart_updater: <latest_version>
```

## Usage

```dart

1. Initialize only once in main file

        void main() async {
        
            flexi_cart.instance.initialize(
            flexi_cart_icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
            flexi_badge_background: Colors.blue,
            flexi_badge_foreground: Colors.white,
            flexi_cart_count: 0);
            
            runApp(const MyApp());

2. Display cart widget

             Column(
                children: <Widget>[
                          flexi_cart.instance.cart(onTap: (){ }),
                             ...
     
3. For increase cart value

                flexi_cart.instance.add();

4. For decrease cart value

                flexi_cart.instance.remove();


5. Update cart value as per your convenient

                flexi_cart.instance.update(newCartCount:5);

6. For clear cart value

                flexi_cart.instance.clear();

```