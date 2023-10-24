package com.gamestoreproject.dao;

import java.util.ArrayList;

import com.gamestoreproject.dto.Game;

public interface GamesDao {

	ArrayList<Game> selectGameList();

}
