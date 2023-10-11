package com.movieProject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class Kkkkk {

	public static void main(String[] args) {
		String cgvMovieUrl = "https://store.steampowered.com/search/?sort_by=Released_DESC&supportedlang=koreana&category1=998&os=win&hidef2p=1&filter=popularnew&ndl=1";
		Document cgvMovieDoc;
		try {
			cgvMovieDoc = Jsoup.connect(cgvMovieUrl).get();
			//System.out.println(cgvMovieDoc);
			Elements urlItems = cgvMovieDoc.select("#search_resultsRows > a");
			ArrayList<String> urlList = new ArrayList<String>();
			for(Element url : urlItems) {
				String urls = url.attr("href");
				urls = urls.split("\\?")[0];
				urls = urls+"?l=koreana";	
				urlList.add(urls);
			}		
			System.out.println(urlList);
			ArrayList<HashMap<String,String>> gameInfoList = new ArrayList<HashMap<String,String>>();
			for(String url : urlList) {	
				HashMap<String,String> gameInfo = new HashMap<String, String>();
				ChromeOptions options = new ChromeOptions();
				options.setPageLoadStrategy(PageLoadStrategy.NORMAL);
				options.addArguments("headless");
				// options.addArguments("headless");	
				cgvMovieDoc = Jsoup.connect(url).get();
				String priceinfo = cgvMovieDoc.select("#game_area_purchase>div:nth-child(1)>div>div:nth-child(4)>div>div").text();
				priceinfo = priceinfo.split(" Add")[0];
				priceinfo = priceinfo.split(" 장바구니에 추가")[0];
				if(priceinfo.equals("")) {
					 priceinfo = cgvMovieDoc.select("#game_area_purchase>div:nth-child(1)>div>div:nth-child(5)>div>div>div.discount_prices>div.discount_original_price").text();	
					 if(priceinfo.equals("")) {
						 continue;
					 }
				} 		
				WebDriver driver = new ChromeDriver(options);
				driver.get(url);
				String gamevideo = driver
					.findElement(By.cssSelector("#highlight_player_area>div:nth-child(2) > video")).getAttribute("src");
				driver.quit();			
				
				//System.out.println("가격: "+priceinfo);
				
				String tInfo = "";
				Elements infos = cgvMovieDoc.select("#genresAndManufacturer");
				if(infos.size()>0) {
					String info = infos.get(0).text();	
					//System.out.println(info);	
					String title = info.split("제목: ")[1].split(" 장르:")[0];				
					//System.out.println("제목 : "+title);
					try {
						String genre = info.split(" 장르: ")[1].split(" 개발자:")[0].replace("장르:", "");
						
						String developer = info.split(" 개발자: ")[1].split(" 배급사:")[0];
						//System.out.println("개발자 : "+developer);
						String publisher = info.split(" 배급사: ")[1].split(" 프랜차이즈:")[0];
						if(publisher.contains("출시일:")) {
							publisher = publisher.split(" 출시일:")[0];
						}
						//System.out.println("배급사 : "+publisher);
						String release = info.split(" 출시일: ")[1].split(" 앞서 해보기")[0];	
//						if(info.contains("프랜차이즈:")) {
//							String franchise = info.split(" 프랜차이즈: ")[1].split(" 출시일:")[0];							
//							System.out.println("프랜차이즈 : "+franchise);					
//						}
						//System.out.println("출시일 : "+release);	
						gameInfo.put("제목", title);
						gameInfo.put("장르", genre);
						gameInfo.put("개발자", developer);
						gameInfo.put("배급사", publisher);
						gameInfo.put("출시일", release);
					} catch (Exception e) {
//						 TODO: handle exception
					}
				}
				gameInfo.put("가격", priceinfo.replace("₩ ", ""));
				//System.out.println("동영상 src :"+gamevideo);	
				gameInfo.put("동영상 src", gamevideo);
				Elements urlInfo = cgvMovieDoc.select("#highlight_strip>div>div>img");
				ArrayList<String> infoList = new ArrayList<String>();				
				String mainImg = cgvMovieDoc.select("#gameHeaderImageCtn > img").attr("src");
				Elements video = cgvMovieDoc.select("#highlight_player_area > div:nth-child(2)");
				//System.out.println(video);				
				//String video = cgvMovieDoc.select("#highlight_player_area > div.highlight_player_item highlight_movie > video").attr("src");
				//infoList.add(video);
				String img = mainImg+" ";
				for(Element info : urlInfo) {
					img += info.attr("src") + " ";
					//System.out.println(src); // 이미지
					//infoList.add(src);
				}
				infoList.add(img);
				img= "";
				for(String info : infoList) {
					//System.out.println("이미지 src: "+info);
					gameInfo.put("이미지 src", info);
				}
				Elements basicinfo = cgvMovieDoc.select("#game_area_description");
				String basic = basicinfo.text();
				//System.out.println(basic);
				gameInfo.put("내용", basic);
				Elements system = cgvMovieDoc.select("div.game_page_autocollapse.sys_req > div > div > div");			
				String sys = system.text();
				//System.out.println(sys);		
				gameInfo.put("시스템", sys);	
				System.out.println(gameInfo);
			}			
//			for(HashMap<String,String> gameInfo :gameInfoList) {
//				System.out.println(gameInfo);
//			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		// System.out.println(urlItems);
	}

}
