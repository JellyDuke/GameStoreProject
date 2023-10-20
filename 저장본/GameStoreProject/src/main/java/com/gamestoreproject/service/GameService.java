package com.gamestoreproject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.GamesDao;
import com.gamestoreproject.dto.Game;

@Service
public class GameService {
	
	@Autowired
	private GamesDao gdao;
	
	public ArrayList<Game> gameList() {
		System.out.println("SERVICE - rankGameList()");
		ArrayList<Game> GameList = gdao.selectGameList();
		return GameList;
	}

}
