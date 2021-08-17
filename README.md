
# quran_flutter

A new Flutter application.

## Getting Started
## Native Splash Screen

### First for android 
1. Go to this path (StudioProjects\quran_Flutter\android\app\src\main\res).
2. put images in different size in files (mipmap-hdpi - mipmap-xxhdpi - mipmap-xxxhdpi).
3. edit file (launch_background.xml) with new assests.

### Second for ios
1. Go to (StudioProjects\quran_Flutter\ios\Runner\Assets.xcassets\LaunchImage.imageset).
2. put images in different size.
3. edit file Contents.json .
4. edit file LaunchScreen.storyboard.

### Image for screen
![splash_bg](https://user-images.githubusercontent.com/66642836/129480076-dc52121f-3499-42e6-94b9-93dd7d363f8a.png)

## Bottom Navigation Bar

### Main Widget
BottomNavigationBar by using bottomNavigationBar in Scafold.

### Consists of 4 bottom navigation bar item
1. Radio
2. Sebha
3. Hadeth
4. quran

### Scaofold body
1. list of the classes
2. by clicking the icon the index changed in (inc) function to the needed class and the body change.

### Image for screen
![bottom bar](https://user-images.githubusercontent.com/61477146/129481287-0167362e-eb91-434c-bcc0-87a7a443f479.png)


## Quraan List

### Main Widget
* GridView which its child is a FlatButton that display the Sorah Name and its Number of Ayat, and the onPressed function redirect you to the Sorah content.
* the header of the page with the title and a photo in a Column Widget.

### Image for the screen
<img src="https://user-images.githubusercontent.com/45634921/129483294-8b489110-ae5d-438a-ae53-2c6fefc27b8b.jpg" alt="drawing" width="200"/>


## Ahadeeth List

### Main Widget
* ListView by using ListView.builder that is returning a Card with a child of ListTile that displays the Hadeeth Number, and the onPressed function redirect you to the Hadeeth content.
* the header of the page with the title and a photo in a Column Widget.

### Image for the screen
<img src="https://user-images.githubusercontent.com/45634921/129483574-bd641658-f8d6-4dae-b6c9-2d09c6a5e288.jpg" alt="drawing" width="200"/>


## Sebha Screen
Usded (RotatedBox) widget for rottation of sebhaBody img
change the "Zekr" on every pressed on the sebha

### Image for the screen
![Screenshot_1629045007](https://user-images.githubusercontent.com/61477146/129485586-265a3d98-ffea-4ee3-80bb-7587d9d97491.png)

### sower content

we display sowar content by roll
![image](https://user-images.githubusercontent.com/60001834/129487277-8eff7790-4dc1-4fd6-a471-0ac19fa94758.png)



### ahadeth content

we display sowar content by roll


![image](https://user-images.githubusercontent.com/60001834/129487329-90626f1f-e42c-4360-b2f4-25db6f5af93e.png)
