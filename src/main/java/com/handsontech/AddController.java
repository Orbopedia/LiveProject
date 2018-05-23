package com.handsontech;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.handsontech.model.AddPlace;
import com.handsontech.model.PlaceBinder;
import com.handsontech.model.ProjectModel;
import com.handsontech.model.UserModel;
import com.handsontech.service.AddService;
import com.handsontech.service.CreateJSON;
import com.handsontech.service.Database;
import com.handsontech.service.StorageInformation;
import com.handsontech.service.UnZip2;

@Controller
public class AddController implements StorageInformation {

	@RequestMapping("/Login")
	public ModelAndView Login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		int UID=-1;
		try {
			UID = Integer.parseInt(session.getAttribute("UID").toString());
		}catch(Exception e) {
			UID=-1;
		}
		if(UID > 0) {
			UserModel bean = new UserModel();
			ProjectModel model = new ProjectModel();
			mv.addObject("UserBeanObject", bean.setAllValues(UID));
			mv.addObject("projectVariable", model.setData(UID));
			mv.setViewName("UploadersDashboard");		
			mv.addObject("status", "Success");
		}else {
			mv.setViewName("Login");
		}
		return mv;
	}
	
	@RequestMapping("/")
	public ModelAndView setSearchPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Search");
		return mv;
	}

	@RequestMapping("/loginConsole")
	public ModelAndView login(@RequestParam("username") String uname, @RequestParam("password") String pass,
			HttpServletRequest request, HttpServletResponse response) {
		Database dbase = new Database();
		String success = null;
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		ResultSet rs = dbase.getResultSet("Select password, UID from users where username = '" + uname + "' and password = '" + pass + "';");
		try {
			if (rs.first()) {
				String Pword = rs.getString("password");
				int UID = rs.getInt("UID");
				if (pass.equals(Pword)) {
					session.setAttribute("Login", uname);
					session.setAttribute("UID", UID+"");
					UserModel bean = new UserModel();
					ProjectModel model = new ProjectModel();
					mv.addObject("UserBeanObject", bean.setAllValues(UID));
					mv.addObject("projectVariable", model.setData(UID));
					mv.setViewName("UploadersDashboard");
				}
			} else {
				mv.setViewName("Login");
				session.setAttribute("UID", -1);
				success = "Invalid login, try again!";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mv.addObject("status", success);
		return mv;
	}
	
	
	@RequestMapping("/Console")
	public ModelAndView reEnter(HttpServletRequest request, HttpServletResponse response) {
		String success = null;
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		int UID = Integer.parseInt(session.getAttribute("UID").toString());
		UserModel bean = new UserModel();
		ProjectModel model = new ProjectModel();
		mv.addObject("UserBeanObject", bean.setAllValues(UID));
		mv.addObject("projectVariable", model.setData(UID));
		mv.setViewName("UploadersDashboard");		
		mv.addObject("status", success);
		return mv;
	}
	
	
	@RequestMapping("/LoginRedirect")
	public ModelAndView loginRedirect(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		int UID = Integer.parseInt(session.getAttribute("UID").toString());
		ModelAndView mv = new ModelAndView();
		if(UID == -1) {
			mv.setViewName("/Login");
			return mv;
		}else {
			mv.setViewName("Login");
			return mv;
		}
	}

	@RequestMapping("/Logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Login");
		mv.addObject("success", "");
		return mv;
	} 

	/**
	 * 
	 * @param file
	 *            CommansMultipart - CommansMultipart file Variable
	 * @param rootPath
	 *            String - Storage Path
	 * @param request
	 *            - HTTPREQUEST
	 * @param PID
	 *            INT PID
	 */

	public String setFile(CommonsMultipartFile file, String rootPath, HttpServletRequest request, int PID,
			String Extension, String SavingName) {
		String path = null;
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File(rootPath);
				if (!dir.exists())
					dir.mkdirs();

				HttpSession session = request.getSession(false);
				if (Integer.parseInt(session.getAttribute("UID").toString()) != 0) {
					path = dir.getAbsolutePath() + File.separator + "PID" + PID + SavingName + "." + Extension;
					File serverFile = new File(path);
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
				} else {

				}
			} catch (Exception e) {
				System.out.println("You failed to upload " + " => " + e.getMessage());
			}
		} else {
			System.out.println("You failed to upload  because the file was empty.");
		}
		return path;
	}

	/**
	 * Upload multiple file using Spring Controller
	 * 
	 * @RequestMapping(value = "/AddPlace", method = RequestMethod.POST)
	 *                       public @ResponseBody String
	 *                       uploadMultipleFileHandler(@RequestParam("files")
	 *                       CommonsMultipartFile[] files, @RequestParam("Tagline")
	 *                       String Tagline, HttpServletResponse
	 *                       response, @RequestParam("inputCity") String
	 *                       City, @RequestParam("inputState") String
	 *                       State, @RequestParam("inputCountry") String
	 *                       Country, @RequestParam("inputContinent") String
	 *                       Continent, @RequestParam("youtubeLink") String
	 *                       youtubelinks, @RequestParam("VisitText") String[]
	 *                       PlacestoVisitN, @RequestParam("VisitImage")
	 *                       CommonsMultipartFile[] VisitImage, HttpServletRequest
	 *                       request ) {
	 */

	@RequestMapping(value = "/AddPlace", method = RequestMethod.POST)
	public @ResponseBody ModelAndView uploadMultipleFileHandler(HttpServletResponse response,
			HttpServletRequest request, @ModelAttribute("Place") PlaceBinder placeB, BindingResult r) {
		ModelAndView mv = new ModelAndView();
		if (r.hasErrors()) {
			mv.setViewName("UploadersDashboard");
			return mv;
		} else {
			CommonsMultipartFile zipMultiPart = null, coverMultiPart = null, textMultiPart = null;
			AddPlace checkPlaces = new AddPlace();
			boolean zip = false, text = false, cover = false, previous = true;
			String ZIPF = null, TEXTF = null, COVERF = null;
			for (int i = 0; i < placeB.getFiles().length; i++) {
				CommonsMultipartFile file = placeB.getFiles()[i];
				String Fname = file.getOriginalFilename();
				System.out.println(Fname + "    :   File Name");
				String extension = Fname.substring(Fname.lastIndexOf(".") + 1, Fname.length());
				System.out.println("Entension : " + extension);
				if (extension.equalsIgnoreCase("zip")) {
					zip = true;
					ZIPF = extension;
					zipMultiPart = file;
				} else if (extension.equalsIgnoreCase("txt")) {
					text = true;
					TEXTF = extension;
					textMultiPart = file;
				} else if (extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("png")) {
					cover = true;
					COVERF = extension;
					coverMultiPart = file;
				}
			}

			for (int i = 0; i < placeB.getVisitImage().length; i++) {
				CommonsMultipartFile file = placeB.getVisitImage()[i];
				String Fname = file.getOriginalFilename();
				String extension = Fname.substring(Fname.lastIndexOf(".") + 1, Fname.length());
				System.out.println(
						"File Name : " + Fname + " Extension : " + extension + " Text : " + placeB.getVisitText()[i]);
				if ((extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("jpeg")
						|| extension.equalsIgnoreCase("png")) && previous == true) {
					previous = true;
					System.out.println("Closed");
				} else {
					System.out.println("Exiting.");
					previous = false;
					break;
				}
			}
			System.out.println(placeB.getInputCity() + " " + placeB.getInputState() + " " + placeB.getInputCountry() + " " + placeB.getInputContinent());
			System.out.println(zip + " " + text + " " + cover);
			if (zip == true && text == true && cover == true && previous == true) {
				int CityID = checkPlaces.checkCity(placeB.getInputCity());
				int StateID = checkPlaces.checkState(placeB.getInputState());
				int CountryID = checkPlaces.checkCountry(placeB.getInputCountry());
				int ContinentID = checkPlaces.checkContinent(placeB.getInputContinent());
				System.out.println(CityID + " " + StateID + " " + CountryID + " " + ContinentID);
				int PID = checkPlaces.checkPID();
				if (CityID > 0) {
					String str = "Select PID from placesRelation where City_Id='" + CityID + "' AND State_ID='"
							+ StateID + "' AND Country_ID='" + CountryID + "' AND Continent_ID='" + ContinentID + "';";
					if (checkPlaces.checkAvailability(str) == -1) {
						checkPlaces.db.executeUpdate(
								"Insert into placesRelation (PID, City_Id, State_id, Country_Id, Continent_Id) values ("
										+ PID + "," + CityID + ", " + StateID + "," + CountryID + ", " + ContinentID
										+ ");");
					} else {
						mv.setViewName("UploadersDashboard");
						return mv;
					}
				} else if (StateID > 0) {
					String str = "Select PID from placesRelation where State_ID='" + StateID + "' AND Country_ID='"
							+ CountryID + "' AND Continent_ID='" + ContinentID + "';";
					if (checkPlaces.checkAvailability(str) == -1) {
						checkPlaces.db.executeUpdate(
								"Insert into placesRelation (PID, City_Id, State_id, Country_Id, Continent_Id) values ("
										+ PID + ",null, " + StateID + "," + CountryID + ", " + ContinentID + ");");
					} else {
						mv.setViewName("UploadersDashboard");
						return mv;
					}
				} else if (CountryID > 0) {
					String str = "Select PID from placesRelation where Country_ID='" + CountryID
							+ "' AND Continent_ID='" + ContinentID + "';";
					if (checkPlaces.checkAvailability(str) == -1) {
						checkPlaces.db.executeUpdate(
								"Insert into placesRelation (PID, City_Id, State_id, Country_Id, Continent_Id) values ("
										+ PID + ",null, null," + CountryID + ", " + ContinentID + ");");
					} else {
						mv.setViewName("UploadersDashboard");
						return mv;
					}
				} else if (ContinentID > 0) {
					String str = "Select PID from placesRelation where Continent_ID='" + ContinentID + "';";
					if (checkPlaces.checkAvailability(str) == -1) {
						checkPlaces.db.executeUpdate(
								"Insert into placesRelation (PID, City_Id, State_id, Country_Id, Continent_Id) values ("
										+ PID + ",null, null, null, " + ContinentID + ");");
					} else {
						mv.setViewName("UploadersDashboard");
						return mv;
					}
				} else {
					mv.setViewName("UploadersDashboard");
					return mv;
				}

				CreateJSON Json = new CreateJSON(PID);
				UnZip2 unzip2 = new UnZip2();
				setFile(textMultiPart, AboutMe, request, PID, TEXTF, "");
				String Val[] = { placeB.getYoutubeLink() };
				Json.createJSONYoutubeVideos(Val);

				String zipPath = setFile(zipMultiPart, ZipFiles, request, PID, ZIPF, "");
				String[] IGpath = unzip2.performUnzip(zipPath, ImageGallery, PID, TestNameImageGal);
				System.out.println("Images Link Here : ");
				System.out.println(IGpath);
				Json.createJSONPhotoGellery(IGpath);

				setFile(coverMultiPart, Cover, request, PID, COVERF, "");
				checkPlaces.db.executeUpdate("Insert into Placedata values (" + PID + ", '" + placeB.getTagline()
						+ "', '" + (Cover + "/PID" + (PID) + "." + COVERF) + "')");

				HttpSession session = request.getSession();
				System.out.println("Length : " + placeB.getVisitTextData().length);
				String PlacestoVisitI[] = new String[placeB.getVisitImage().length];
				for (int i = 0; i < placeB.getVisitImage().length; i++) {
					CommonsMultipartFile file = placeB.getVisitImage()[i];
					String Fname = file.getOriginalFilename();
					String extension = Fname.substring(Fname.lastIndexOf(".") + 1, Fname.length());
					setFile(file, PlacesToVisit, request, PID, extension, "ID" + i);
					PlacestoVisitI[i] = TestPlacesToVisit + File.separator + "PID" + PID + "ID" + i + "." + extension;
				}
				Json.createJSONPlacesToVisitData(placeB.getVisitTextData());
				Json.createJSONPlacesToVisitImages(PlacestoVisitI);
				Json.createJSONPlacesToVisitText(placeB.getVisitText());

				Json.finalzeJSONFile(); // Finalize JSON File

				String pattern = "yyyy-MM-dd";
				String TimePattern = "HH:mm:ss";
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
				String Dated = simpleDateFormat.format(new Date());
				simpleDateFormat = new SimpleDateFormat(TimePattern);
				String TimeT = simpleDateFormat.format(new Date());
				checkPlaces.db.executeUpdate("Insert into UserCreation (PID, UID, Date, Time) value (" + PID + ", "
						+ session.getAttribute("UID") + ", '" + Dated + "', '" + TimeT + "');");
				mv.setViewName("Place");
				mv.addObject("PlaceIdentification", PID+"");
				return mv;
			} else {
				mv.setViewName("UploadersDashboard");
				return mv;
			}
		}
	}
}
