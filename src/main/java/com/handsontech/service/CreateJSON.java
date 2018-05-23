package com.handsontech.service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class CreateJSON implements StorageInformation {
	int PID = 0;
	JSONObject obj = new JSONObject();

	public CreateJSON(int PID) {
		this.PID = PID;
	}

	public void createJSONYoutubeVideos(String[] Youtubevideos) {
		JSONArray list = new JSONArray();
		for(String val:Youtubevideos) {
			list.add(val);
		}
		obj.put("YoutubeVideosList", list);
	}
	
	public void createJSONYoutubeVideosShots(String[] YoutubeImageShots) {
		JSONArray list = new JSONArray();
		for(String val:YoutubeImageShots) {
			list.add(val);
		}
		obj.put("YoutubeSelectImages", list);
	}
	
	public void createJSONPhotoGellery(String[] PhotoGelleryImages) {
		JSONArray list = new JSONArray();
		for(String val:PhotoGelleryImages) {
			list.add(val);
		}
		obj.put("ImageGallery", list);
	}
	
	public void createJSONPlacesToVisitText(String[] PlacesToVisitTextList) {
		JSONArray list = new JSONArray();
		for(String val:PlacesToVisitTextList) {
			list.add(val);
		}
		obj.put("PlacesToVisit", list);
	}
	
	public void createJSONPlacesToVisitImages(String[] PlacesToVisitImgList) {
		JSONArray list = new JSONArray();
		for(String val:PlacesToVisitImgList) {
			list.add(val);
		}
		obj.put("PlacesToVisitImages", list);
	}
	
	public void createJSONPlacesToVisitData(String[] PlacesToVisitImgList) {
		JSONArray list = new JSONArray();
		for(String val:PlacesToVisitImgList) {
			list.add(val);
		}
		obj.put("PlaceToVistiData", list);
	}
	
	public void finalzeJSONFile() {
		try {
			FileWriter file = new FileWriter(JsonFile + PID + ".json");
			file.write(obj.toJSONString());
			file.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
