package com.handsontech.beans;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;

import com.handsontech.service.Database;
import com.handsontech.service.JsonParser;

public class ResourcesBeans {
	String ImagePath;
	String YoutubeIFrame = "";
	String YoutubeScreenIcon="";
	String ImageGallery="";
	String Text="";
	String Tagline;
	JsonParser p;

	public String getYoutubeVideos() {
		return YoutubeIFrame;
	}
	
	public String YoutubeScreenImage() {
		return YoutubeScreenIcon;
	}
	
	public String textFile() {
		return Text;
	}
	
	public void LoadParserDetails(int PID, String JSONLocation) {
		p = new JsonParser();
		p.loadFile(JSONLocation + PID + ".JSON");
	}
	
	public void setReadPlaceTextFile(int PID, String Location) throws IOException{
		File path = new File(Location + "PID"+PID + ".txt");
        int i;
        FileReader file = new FileReader(path);
        while ((i = file.read()) != -1) {
            Text += ((char)i);
        }
        file.close();
	}
	
	public String setFetchYoutubeVideos() {
        Iterator<String> loadVideo = p.getYoutubeVideosList();
        return loadVideo.next();
	}
	
	public Iterator<String> setFetchYoutubeScreenIcon() {
        Iterator<String> itrator = p.getYoutubeImageList();
        /*while (itrator.hasNext()) {
            i += 1;
            YoutubeScreenIcon += "<img class=\"demo w3-opacity w3-hover-opacity-off\" src=\"<c:url value=\"/resources/"+itrator.next()+"\"    \" alt=\"vid"+i+"\" style=\"max-height: 100px\" onclick=\"currentVid("+i+")\">&nbsp;&nbsp;&nbsp;";
            //YoutubeScreenIcon += "<img class='demo w3-opacity w3-hover-opacity-off' src=\"<c:url value='/resources/" + itrator.next() + "/>\" alt='vid1' style='max-height: 100px' onclick='currentVid(" + i + ")'>&nbsp;&nbsp;&nbsp;";
        }*/
        return itrator;
	}
	
	public Iterator<String> setFetchImageGallery() {
        Iterator<String> itrator = p.getImageGalleryList();
        return itrator;
	}
	
	
	public void setLoadImageGallery() {
		 Iterator<String> ImageGalleryItrator = p.getImageGalleryList();
         while (ImageGalleryItrator.hasNext()) {
             ImageGallery += "<img class='mySlides w3-animate-opacity' src='" + ImageGalleryItrator.next().replaceAll("\\", "") + "' style='width:100%'>";
         }
	}
	
	public void setTagline(int PID) {
		Database db = new Database();
		ResultSet rs = db.getResultSet("Select TagLine from places where Place_Id = "+PID+";");
	}
	
	String placesToVisit = "";
	
	
	public ArrayList<PlacesToVisit> setFetchPlacesToVisit() {
        Iterator<String> itrator = p.placesToVisitName();
        Iterator<String> itrator2 = p.placesToVisitImages();
        Iterator<String> iterator3 = p.placesToVisitDescription();
        ArrayList<PlacesToVisit> PTV = new ArrayList<PlacesToVisit>();
        while(itrator.hasNext() && itrator2.hasNext() && iterator3.hasNext()) {
        	PlacesToVisit ptv = new PlacesToVisit();
        	ptv.Description = iterator3.next();
        	ptv.Images = itrator2.next().replace("\\","");
        	ptv.Name = itrator.next();
        	PTV.add(ptv);
        }
        return PTV;
	}
	
	public class PlacesToVisit{
		private String Name;
		private String Images;
		private String Description;
		public String getName() {
			return Name;
		}
		public void setName(String name) {
			Name = name;
		}
		public String getImages() {
			return Images;
		}
		public void setImages(String images) {
			Images = images;
		}
		public String getDescription() {
			return Description;
		}
		public void setDescription(String description) {
			Description = description;
		}
		
		
	}
	
}
