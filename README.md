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
  flexiCart_updater: <latest_version>
```

## Usage

```dart

1. Initialize only once in main file

  - if you want to assign material color directly then write code inside main file or in initstate method :

        void main() async {

            flexiCart.instance.initialize(
                    flexiCartIcon: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
                    flexiBadgeBackground: Colors.blue,
                    flexiBadgeForeground: Colors.white,
                    flexiCartCount: 0
            );
            
            runApp(  ...

  - if you want to assign theme colors then it is required to write inside build method :

            @override
            Widget build(BuildContext context) {
            
                flexiCart.instance.initialize(
                flexiCartIcon: Icon(Icons.shopping_cart_outlined,color: Theme.of(context).colorScheme.onBackground,),
                flexiBadgeBackground: Theme.of(context).colorScheme.primary,
                flexiBadgeForeground: Theme.of(context).colorScheme.background,
                flexiCartCount: 10);
                
                return Scaffold( ...

2. Display cart widget

             Column(
                children: <Widget>[
                          flexiCart.instance.cart(onTap: (){ }),
                             ...
     
3. For increase cart value

                flexiCart.instance.add();

4. For decrease cart value

                flexiCart.instance.remove();


5. Update cart value as per your convenient

                flexiCart.instance.update(newCartCount:5);

6. For clear cart value

                flexiCart.instance.clear();

```