# Dai-Hentai 3.0 English
## Cheap Google Translate Edition 
Go to releases for ipa.
## Overview
This project is an app that makes it easy for iOS devices to read, use, and collect the content of the e / ex hentai website. Since the content of this website is mostly viewed by adults, if you don't like the content, please don't use >x<, thank you.

Of course, regardless of the content, any questions about the code or use are welcome to suggest >w< 

After clicking on the thumbnails below, you can lead to YouTube to watch the video of the general function. 

<a href="http://www.youtube.com/watch?feature=player_embedded&v=DqkIxhpzP9s
" target="_blank"><img src="http://img.youtube.com/vi/DqkIxhpzP9s/0.jpg" 
alt="newHentai" width="240" height="180" border="10" /></a>

The overall user experience should be more stable and faster than 2.x, and the lock function is also added, so that everyone can be more at ease in use =w= 

## Tag Chinese conversion(Probably not relevant to you)
Thanks to the friends next door to have organized tags that can be found, so the conversion reference content here is from https://github.com/Mapaler/EhTagTranslator , thank you very much 

## Native Xcode direct installation method
1. Get the project (two methods)

 - Use Download ZIP or Release and unzip;
 - Clone the project `$ git clone https://github.com/Franck-Nein/Dai-Hentai_English.git` Copy the project database；
 
2. Rebuild (restore) `Pods`
  ![](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7+2016-12-07+%E4%B8%8A%E5%8D%8810.27.08.png)

 ```bash
 $ cd Dai-Hentai # # Enter the project directory
 $ pod install # Do not use pod update
```

 *If `pod` is not available, please install [CocoaPods](https://cocoapods.org/)*

 ```bash
 sudo gem install cocoapods
```
3. Open the project<br>
  **Please select `e-Hentai.xcworkspace` Instead of `e-Hentai.xcodeproj`**

  ![](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7+2016-10-22+%E4%B8%8B%E5%8D%8810.26.35.png)
  
## Windows / Linux no JB method  
Later [VVVVictorJ](https://github.com/VVVVictorJ) suggested that Cydia Impactor has no way to install it, you can use the [AltStore](https://altstore.io/), suggested by [shinrenpan](https://github.com/shinrenpan)

**One thing to note, this installation method has a seven-day limit period, and needs to be re-installed within the deadline.**

## Support
- iOS9.0 and above
- iPhone / iPad

## Try the latest beta version

[Click me to appetize](https://appetize.io/embed/qk23vcyrmbtecy7n12h6118wa4?device=iphone7&scale=100&orientation=portrait&osVersion=10.0&deviceColor=white)

However, because it is a free account, there is only 100 minutes of trial for a month, and the cost is 0.05 mg per minute. The cost is too high. Those who have played can only say goodbye, and those who have not played can directly use the following IPA file...if possible O3Ob 
## The latest test version IPA

Because of laziness, I am too lazy to manually release the version every time, so I use a service that automatically produces ipa, which will operate whenever there is a new commit.

![](https://app.bitrise.io/app/446db4b9b316a724.svg?token=I0YMFQ8S5i30cN95ZVgvhw)

^^^^^^^^^^^^^ The above string of text is `Bitrise Passing` When, you can get the latest version

The identification of the version consists of a combination of two parts 
  * [Version number](https://github.com/DaidoujiChen/Dai-Hentai/blob/3.0_master/Dai-Hentai.xcodeproj/project.pbxproj#L1072)
  * [Build number](https://github.com/DaidoujiChen/Dai-Hentai/blob/3.0_master/Dai-Hentai.xcodeproj/project.pbxproj#L1067)

Can form the following URL 

```
https://s3-ap-northeast-1.amazonaws.com/dai-hentai-ipa/bitrise/{Version number}_{Build number}/Dai-Hentai.ipa
```

Take the example URL of the current compiled file as `https://s3-ap-northeast-1.amazonaws.com/dai-hentai-ipa/bitrise/3.10_20191225/Dai-Hentai.ipa`

## 1 Magnesium donation box(Donate, the translation made me laugh, so I will keep it)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=N86FK92G3V4BS)
<img alt="" border="0" src="https://www.paypalobjects.com/zh_TW/i/scr/pixel.gif" width="1" height="1">

[Donation history sheet ](https://docs.google.com/spreadsheets/d/17eY6Hi2Ol-tbb3pL11yRoAg6SeNKa-plj4VJvSuPQY8/edit#gid=0)
