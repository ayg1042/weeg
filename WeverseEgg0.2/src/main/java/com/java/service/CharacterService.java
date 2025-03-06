package com.java.service;

public interface CharacterService {

	Integer getCoin(Integer userId);

	void updateCoin(Integer userId, int newCoin);

}
