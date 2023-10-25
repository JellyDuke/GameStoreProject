package com.gamestoreproject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.GameDao;
import com.gamestoreproject.dto.Game;

@Service
public class GameService {
	
	@Autowired
	private GameDao gdao;
	
	public ArrayList<Game> gameList() {
		System.out.println("SERVICE - rankGameList()");
		ArrayList<Game> GameList = gdao.selectRankGameList();
		return GameList;
	}
	public ArrayList<Game> getgameList(int gameCount) {
		System.out.println("SERVICE - getgameList()");
		ArrayList<Game> GameList = gdao.selectGameList(gameCount);
		return GameList;
	}
}
