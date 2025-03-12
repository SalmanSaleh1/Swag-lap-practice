*** Settings ***
Library    AppiumLibrary
Resource    locators.robot

*** Variables ***
${APPIUM_SERVER}       http://127.0.0.1:4723
${PLATFORM_NAME}       Android
${DEVICE_NAME}         Android Emulator
${AUTOMATION_NAME}     UiAutomator2
${APP_PACKAGE}         com.swaglabsmobileapp
${APP_ACTIVITY}        com.swaglabsmobileapp.MainActivity