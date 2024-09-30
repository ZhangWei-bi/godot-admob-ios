bi notes: 

Omited a few commits to keep Google-mobile-ads-sdk at version 10.9.
(This is to match the version of our firebase matching dependencies)
Current firebase sdk: https://github.com/firebase/firebase-ios-sdk/releases/tag/10.14.0

Commits skiped:
https://github.com/poingstudios/godot-admob-ios/commit/36692656f2ae42525ce606c2a2d224c88dbeb1f8
https://github.com/poingstudios/godot-admob-ios/commit/86de27231904c1b51510d0446bc6d6d899baece6
https://github.com/poingstudios/godot-admob-ios/commit/4c912ca67951a85d2f122b30ae1d678fe768adfb
https://github.com/poingstudios/godot-admob-ios/commit/36692656f2ae42525ce606c2a2d224c88dbeb1f8

In order to use the latest commit instead, would need to use this versio of firebase:
https://github.com/firebase/firebase-ios-sdk/releases/tag/10.25.0

It would match with Google-Mobile-Ads-SDK 11.3 which is the same version as the tip of poing

<h1 align="center">
  <br>
  <img src="https://i.imgur.com/N2OW34R.png" alt="GodotAdMob" width=500>
  <br>
  Godot AdMob iOS
  <br>
</h1>

<h4 align="center">A Godot's plugin for iOS of <a href="https://admob.google.com" target="_blank">AdMob</a>.</h4>

<p align="center">
  <a href="https://github.com/Poing-Studios/godot-admob-ios/releases">
    <img src="https://img.shields.io/github/v/tag/Poing-Studios/godot-admob-ios?label=Version">
  </a>
  <a href="https://github.com/Poing-Studios/godot-admob-ios/actions/workflows/release_ios.yml">
    <img src="https://github.com/Poing-Studios/godot-admob-ios/actions/workflows/release_ios.yml/badge.svg">
  </a>
  <a href="https://github.com/Poing-Studios/godot-admob-ios/releases">
    <img src="https://img.shields.io/github/downloads/Poing-Studios/godot-admob-ios/total?style=social">
  </a>
  <img src="https://img.shields.io/github/stars/Poing-Studios/godot-admob-ios?style=social">
  <img src="https://img.shields.io/github/license/Poing-Studios/godot-admob-ios?style=plastic">
</p>

<p align="center">
  <a href="#❓-about">About</a> •
  <a href="#🙋‍♂️how-to-use">How to use</a> •
  <a href="#📄documentation">Docs</a> •
  <a href="https://github.com/Poing-Studios/godot-admob-ios/releases">Downloads</a> 
</p>

## ❓ About 

<img src="static/usage.webp" align="right"
     alt="Preview" width="auto" height="390">


This repository is for a _Godot Engine Plugin_ that allows showing the ads offered by **AdMob** in an **easy** way, without worrying about the building or version, **just download and use**.

The **purpose** of this plugin is to always keep **up to date with Godot**, supporting **ALMOST ALL** versions from v4.1+, and also make the code **compatible** on **[Android](https://github.com/Poing-Studios/godot-admob-android) and iOS**, so each advertisement will work **identically on both systems**.

### 🔑 Key features

- It's a wrapper for [Google Mobile Ads SDK](https://developers.google.com/admob/ios/download). 🎁
- Easy Configuration. 😀
- Supports nearly all Ad Formats: **Banner**, **Interstitial**, **Rewarded**, **Rewarded Interstitial**. 📺
- GDPR Compliance with UMP Support. ✉️
- Targeting Capabilities. 🎯
- Seamless integration with Mediation partners: **AdColony**, **Meta**, **Vungle**. 💰
- CI/CD for streamlined development and deployment. 🔄🚀
- Features a dedicated [Godot Plugin](https://github.com/Poing-Studios/godot-admob-plugin), reducing the need for extensive coding. 🔌
- There is also an [Android Plugin](https://github.com/Poing-Studios/godot-admob-android) available, which has the same behavior. 🤖

## 🙋‍♂️How to use 
- We recommend you to use the [AdMob Plugin](https://github.com/Poing-Studios/godot-admob-plugin), you can download direcly from [Godot Assets](https://godotengine.org/asset-library/asset/2063).
- After download, we recommend you to read the [README.md](https://github.com/Poing-Studios/godot-admob-plugin/blob/master/README.md) of the Plugin to know how to use.

## 📦Installing:

### 📥Download
- To get started, download the `poing-godot-admob-ios-v{{ your_godot_version }}.zip` file from the [releases tab](https://github.com/Poing-Studios/godot-admob-ios/releases). We recommend checking the [supported Godot version](https://github.com/Poing-Studios/godot-admob-versions/blob/master/versions.json) before proceeding. You can also use the [AdMob Plugin](https://github.com/Poing-Studios/godot-admob-plugin) for this step by navigating to `Tools -> AdMob Download Manager -> iOS -> LatestVersion`.


### 🧑‍💻Usage
- Video tutorial: https://youtu.be/WpVGn7ZasKM.
- Inside `poing-godot-admob-ios-v{{ your_godot_version }}.zip` you downloaded, you will face some folders like `'ads'`, `'adcolony'`, `'meta'`, `'vungle'`. To AdMob works only `'ads'` is required, but if you want [Mediation](https://support.google.com/admob/answer/13420272?hl=en), you need the other folders.
- Move the content inside the folder which you need into ```res://ios/plugins``` directory on your Godot project.
- Update the configuration in ```res://ios/plugins/poing-godot-admob-ads.gdip```. The `GADApplicationIdentifier` is required to change when release your game.
- If you are using Mediation: On `SKAdNetworkItems` in `.gdip` file, you can remove the comments of the [Mediations Networks](https://developers.google.com/admob/ios/choose-networks) which you are using.
- Export the project enabling the `Ad Mob`, if you have Mediation, also mark `Ad Mob Meta`, `Ad Mob AdColony` etc...

### 💻Xcode preparation
- Go to `{{ ios_xcode_export_folder }}/{{your_project_name}}/ios/plugins/poing-godot-admob/scripts/` folder and open the terminal (must be inside this folder).
- Run the commands: 
```bash
chmod +x update_and_install.sh
./update_and_install.sh
```
- This will create for your a `{{ your_project_name }}.xcworkspace` file on your `{{ ios_xcode_export_folder }}`, open this file.
- Go to the Target of your Application and them `General -> Frameworks, Libraries, and Embedded Content` and add all `Pods` in section.
- Run the Game.
- [If you are trying to run on Simulator and is not working read this](https://github.com/godotengine/godot/issues/44681#issuecomment-751399783).


## 📎Useful links:
- 🦾 Godot Plugin: https://github.com/Poing-Studios/godot-admob-plugin
- 🤖 Android: https://github.com/Poing-Studios/godot-admob-android
- ⏳ Plugin for Godot below v4.1: https://github.com/Poing-Studios/godot-admob-ios/tree/v2

## 📄Documentation
For a complete documentation of this Plugin: [check here](https://poing-studios.github.io/godot-admob-plugin/).

Alternatively, you can check the docs of AdMob itself of [iOS](https://developers.google.com/admob/ios/quick-start).

## 🙏 Support
If you find our work valuable and would like to support us, consider contributing via these platforms:

[![Patreon](https://img.shields.io/badge/Support%20us%20on-Patreon-orange?style=for-the-badge&logo=patreon)](https://patreon.com/poingstudios)

[![Ko-fi](https://img.shields.io/badge/Buy%20us%20a-coffee-yellow?style=for-the-badge&logo=ko-fi)](https://ko-fi.com/poingstudios)

[![Paypal](https://img.shields.io/badge/Donate-via%20Paypal-blue?style=for-the-badge&logo=paypal)](https://www.paypal.com/donate/?hosted_button_id=EBUVPEGF4BUR8)

Your support helps us continue to improve and maintain this plugin. Thank you for being a part of our community!


## 🆘Getting help
[![DISCUSSIONS](https://img.shields.io/badge/Discussions-green?style=for-the-badge)](https://github.com/Poing-Studios/godot-admob-ios/discussions)
[![DISCORD](https://img.shields.io/badge/Discord-7289DA?style=for-the-badge)](https://discord.com/invite/YEPvYjSSMk)


## ⭐ Star History
If you appreciate our work, don't forget to give us a star on GitHub! ⭐

![Star History Chart](https://api.star-history.com/svg?repos=Poing-studios/godot-admob-ios&type=Date)
