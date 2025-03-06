package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.repository.CharacterRepository;

import jakarta.transaction.Transactional;

@Service
public class CharacterServiceImpl implements CharacterService {

    @Autowired
    CharacterRepository characterRepository;

    @Override
    public Integer getCoin(Integer userId) {
        return characterRepository.findCoinByUserId(userId);
    }

    @Override
    @Transactional
    public void updateCoin(Integer userId, int newCoin) {
        characterRepository.updateCoinByUserId(userId, newCoin);
    }
}
