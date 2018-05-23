package com.handsontech.service;

import java.io.FileReader;
import java.util.Iterator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class JsonParser {
	JSONParser parser;
	Object obj;
	JSONObject jsonObject;

	public void loadFile(String Location) {
		parser = new JSONParser();
		try {
			obj = parser.parse(new FileReader(Location));
			jsonObject = (JSONObject) obj;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Iterator<String> getYoutubeImageList() {
		try {
			JSONArray youtubeImagelist = (JSONArray) jsonObject.get("YoutubeSelectImages");
			Iterator<String> iterator = youtubeImagelist.iterator();
			/*
			 * while (iterator.hasNext()) { System.out.println(iterator.next()); }
			 */
			return iterator;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Iterator<String> getImageGalleryList() {
		try {
			JSONArray ImageGallaryList = (JSONArray) jsonObject.get("ImageGallery");
			Iterator<String> iterator = ImageGallaryList.iterator();
			
			  //while (iterator.hasNext()) { System.out.println(iterator.next()); }
			 
			return iterator;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Iterator<String> getYoutubeVideosList() {
		try {
			JSONArray YoutubeList = (JSONArray) jsonObject.get("YoutubeVideosList");
			Iterator<String> iterator = YoutubeList.iterator();
			/*
			 * while (iterator.hasNext()) { System.out.println(iterator.next()); }
			 */
			return iterator;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Iterator<String> placesToVisitName() {
		try {
			JSONArray PTV = (JSONArray) jsonObject.get("PlacesToVisit");
			Iterator<String> iterator = PTV.iterator();
			return iterator;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Iterator<String> placesToVisitImages() {
		try {
			JSONArray PTVI = (JSONArray) jsonObject.get("PlacesToVisitImages");
			Iterator<String> iterator = PTVI.iterator();
			return iterator;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Iterator<String> placesToVisitDescription() {
		try {
			JSONArray PTVDList = (JSONArray) jsonObject.get("PlaceToVistiData");
			Iterator<String> iterator = PTVDList.iterator();
			return iterator;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
