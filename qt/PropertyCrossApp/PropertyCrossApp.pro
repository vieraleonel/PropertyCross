TEMPLATE = app
QT       += core
QT       += qml quick widgets
QT       += positioning

TARGET = PropertyCross
CONFIG   += C++11
#CONFIG   -= app_bundle
#QT += macextras

SOURCES += \
    src/main.cpp

INCLUDEPATH += ../PropertyCrossLib/include
INCLUDEPATH += ../PropertyCrossLib/src

OTHER_FILES += \
    qml/MainWindow.qml

RESOURCES += \
    myresources.qrc

#ANDROID_EXTRA_LIBS += libPropertyCrossLib.so
DISTFILES += \
    qml/RootView.qml \
    qml/SearchResultsView.qml \
    qml/PropertyView.qml \
    qml/FavouritesView.qml \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    qml/DelegateProperties.qml \
    qml/DelegateRecentSearches.qml \
    qml/+ios/AppStyle.qml \
    qml/AppStyle.qml \
    qml/qmldir \
    qml/+android/AppStyle.qml \
    qml/FooterProperties.qml

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../PropertyCrossLib/release/ -lPropertyCrossLib
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../PropertyCrossLib/debug/ -lPropertyCrossLib
else:unix: LIBS += -L$$OUT_PWD/../PropertyCrossLib/ -lPropertyCrossLib

INCLUDEPATH += $$PWD/../PropertyCrossLib
DEPENDPATH += $$PWD/../PropertyCrossLib

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/../../build-PropertyCross-Android_for_armeabi_v7a_GCC_4_9_Qt_5_5_0-Debug/android-build/libs/armeabi-v7a/libPropertyCrossLib.so
#    ANDROID_BUNDLED_IN_LIB = libPropertyCrossLib.so
}

mac {
QMAKE_INFO_PLIST = ios/info.plist
ios_icon.files = $$files($$PWD/res/ic_launcher.png)
QMAKE_BUNDLE_DATA += ios_icon
}

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

#message($$INCLUDEPATH)
