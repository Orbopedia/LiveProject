package com.handsontech.service;

public interface StorageInformation {
	String Cover = "C:/Tour/Images/CoverPICS/";
	String AboutMe = "C:/Tour/Text/AboutMe/";
	String ZipFiles = "C:/Tour/Images/ZipFiles/";
	String JsonFile = "C:/Tour/Json/";
	String ImageGallery = "C:/Tour/Images/UserData/";
	String TestNameImageGal = "/Images/UserData/";
	String PlacesToVisit = "C:/Tour/Images/PlacesToVisit/";
	String TestPlacesToVisit = "/Images/PlacesToVisit/";
	/**
	 * File Formate Supported
	 */
	String zipSupport[] = {"zip"};
	String textSupport[]  = {"txt"};
	String imageSupport[] = {"jpg", "png"};
	
	/**
	 * Extracted Zip file format is : IG(PID)C(COUNTER VALUE).EXTENSION
	 */
}
