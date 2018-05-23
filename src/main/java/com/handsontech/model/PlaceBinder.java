package com.handsontech.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class PlaceBinder {
	
	/*
	 * VisitTextData layout is still pending in CreatePlaceData.jsp 
	 * */
	
	CommonsMultipartFile[] files;
	String Tagline;
	String inputCity;
	String inputState;
	String inputCountry;
	String inputContinent;
	String youtubeLink;
	String[] VisitText;
	CommonsMultipartFile[] VisitImage;
	String[] VisitTextData;
	
	public CommonsMultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(CommonsMultipartFile[] files) {
		this.files = files;
	}
	public String getTagline() {
		return Tagline;
	}
	public void setTagline(String tagline) {
		Tagline = tagline;
	}
	public String getInputCity() {
		return inputCity;
	}
	public void setInputCity(String inputCity) {
		this.inputCity = inputCity.replace("%s", " ");
	}
	public String getInputState() {
		return inputState;
	}
	public void setInputState(String inputState) {
		this.inputState = inputState;
	}
	public String getInputCountry() {
		return inputCountry;
	}
	public void setInputCountry(String inputCountry) {
		this.inputCountry = inputCountry;
	}
	public String getInputContinent() {
		return inputContinent;
	}
	public void setInputContinent(String inputContinent) {
		this.inputContinent = inputContinent;
	}
	public String getYoutubeLink() {
		return youtubeLink;
	}
	public void setYoutubeLink(String youtubeLink) {
		this.youtubeLink = youtubeLink;
	}
	public String[] getVisitText() {
		return VisitText;
	}
	public void setVisitText(String[] visitText) {
		VisitText = visitText;
	}
	public CommonsMultipartFile[] getVisitImage() {
		return VisitImage;
	}
	public void setVisitImage(CommonsMultipartFile[] visitImage) {
		VisitImage = visitImage;
	}
	public String[] getVisitTextData() {
		return VisitTextData;
	}
	public void setVisitTextData(String[] visitTextData) {
		VisitTextData = visitTextData;
	}
	
	
}
