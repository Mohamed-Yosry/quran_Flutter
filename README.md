

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
![Screenshot_1629236233](https://user-images.githubusercontent.com/61477146/129805036-5ed16d8b-8038-4d3e-b98a-9a4e651be173.png)

### Image for screen
![Screenshot_1629236276](https://user-images.githubusercontent.com/61477146/129805045-b89754bf-7274-4e7f-96a4-c5fa4f7c772b.png)



## Quraan List

### Main Widget
* GridView which its child is a FlatButton that display the Sorah Name and its Number of Ayat, and the onPressed function redirect you to the Sorah content.
* the header of the page with the title and a photo in a Column Widget.

### Image for the screen
![Screenshot_1629236253](https://user-images.githubusercontent.com/61477146/129805817-ddeb6ba9-114f-4486-93ca-35ea9a66fc12.png)
![Screenshot_1629236293](https://user-images.githubusercontent.com/61477146/129805825-9fb721cd-22f7-498c-90e5-a39fe7f78f4d.png)


## Ahadeeth List

### Main Widget
* ListView by using ListView.builder that is returning a Card with a child of ListTile that displays the Hadeeth Number, and the onPressed function redirect you to the Hadeeth content.
* the header of the page with the title and a photo in a Column Widget.

### Image for the screen
![Screenshot_1629236297](https://user-images.githubusercontent.com/61477146/129805889-3792e101-b8fd-436f-b575-16f5020781f9.png)
![Screenshot_1629237341](https://user-images.githubusercontent.com/61477146/129805898-4676c996-4131-439e-b6be-08e8c059e765.png)



## Sebha Screen
Usded (RotatedBox) widget for rottation of sebhaBody img
change the "Zekr" on every pressed on the sebha

### Image for the screen
![Screenshot_1629237013](https://user-images.githubusercontent.com/61477146/129805389-38a86761-d190-459e-980b-d54987d9487d.png)
![Screenshot_1629236264](https://user-images.githubusercontent.com/61477146/129805400-07644c14-e2a0-4adf-88f4-875d4070a092.png)


### sower content

we display sowar content by roll
![Screenshot_1629236258](https://user-images.githubusercontent.com/61477146/129805483-ff53da7a-6c5e-442e-8d85-7d807279ca7d.png)
![Screenshot_1629237098](https://user-images.githubusercontent.com/61477146/129805486-883f5d9a-3637-4e6e-b941-f0e1cbfabdbd.png)




### ahadeth content

we display sowar content by roll


![image](https://user-images.githubusercontent.com/60001834/129487329-90626f1f-e42c-4360-b2f4-25db6f5af93e.png)
![Screenshot_1629237167](https://user-images.githubusercontent.com/61477146/129805659-26ed3e1a-6408-4c4f-b9b6-eb56beafa547.png)


## side menu
### Image for the screen
![Screenshot_1629236271](https://user-images.githubusercontent.com/61477146/129805161-6edc4607-ff97-4405-9409-b84c04c4dc89.png)
![Screenshot_1629236283](https://user-images.githubusercontent.com/61477146/129805188-38916d0f-bc88-4047-82d8-fc5e78a3145c.png)

## Radio
### Image for the screen
![Screenshot_1630281474](https://user-images.githubusercontent.com/61477146/131269862-2e07df9b-874a-4774-bc36-1b9bcb1f94e3.png)
![Screenshot_1630281559](https://user-images.githubusercontent.com/61477146/131269866-1b0a126d-f9b8-4ca0-adcc-147c9c313c87.png)


