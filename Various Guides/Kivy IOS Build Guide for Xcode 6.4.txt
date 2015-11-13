#Kivy IOS Build Guide for Xcode 6.4



I had a lot of trouble building my kivy project for IOS and after weeks of tinkering and tediously troubleshooting through the issues I finally got it to work. This is a detailed guide to what worked for me and some of the hurdles that I found along the way.



This guide will be focused on building the Touchtracer app, which is an demo app that should have already be included when you installed Kivy. Assuming you put Kivy into the applications folder when you installed it, the Touchtracer example should be located in this path: 



```

/Applications/Kivy.app/Contents/Resources/kivy/examples/demo/touchtracer

```



Make sure it is there and make sure that there is a file called “main.py” in the folder. I would also open it up in your python IDE and run it. This way you will know how the app is suppose to work after it is compiled for the Xcode IOS simulator.




##Prerequisites



You can only compile for IOS on a Mac. Python 2.7 comes preinstalled with your Mac, you will need to use that version. 

Also, you will need Kivy 1.9 obviously. 

Next you will need Xcode version 6.4, not Xcode 7.1. I tried many different versions of Xcode and as of now, I have only found Xcode 6.4 to work. Xcode 6.4 can be found here: (https://developer.apple.com/downloads/).



You do need to have a developer ID, but you do not need to pay the $99, unless you want to publish apps.



You will also need Homebrew, which will make getting the additional dependencies a lot easier. Link to Homebrew is here: (http://brew.sh).



Once you have Homebrew set up, use the following codes in your terminal:

```

xcode-select —-install
brew install autoconf automake libtool pkg-config

brew link libtool
sudo easy_install pip

sudo pip install cython==0.21.2

sudo xcode-select —switch /Applications/Xcode.app

brew doctor

```


If everything is working “brew doctor” should just give you one warning telling you your Xcode 6.4 is out of date.



Finally, clone the distribution package from github.



```

git clone git://github.com/kivy/kivy-ios

```



##Compiling Kivy



Once all of the prerequisites are met, you can start compiling. This will process will take your computer some time.  



```

cd kivy-ios

./toolchain.py build kivy

```



##Creating Projects



Once the compile is complete you can start creating Xcode projects. 

Use the following code to create the Touchtracer demo app. Make sure that the path refers to the location of the “main.py” file. 

```

./toolchain.py create Touchtracer /Applications/Kivy.app/Contents/Resources/kivy/examples/demo/touchtracer

open touchtracer-ios/touchtracer.xcodeproj

```



To create other projects, simply replace “Touchtracer” with the name you want to call your new project, followed by the file path of the python file for your project. Again make sure that the python file is named “main.py”.



If everything works, when you press the “play” button in Xcode and you will be able to play with the touchtracer in the IOS simulator. 



There might be three non-fatal “Apple Mach-O Linker Warnings” that will pop up in your Xcode, something like: “ld: warning: directory not found for option '-F/Users/tingbochen/kivy-ios/dist/frameworks’”, these can be ignored. 




Good Luck!

