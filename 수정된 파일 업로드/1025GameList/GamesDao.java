package com.gamestoreproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Game;

public interface GamesDao {

	ArrayList<Game> selectGameList(@Param("gameCount") int gameCount);

}
