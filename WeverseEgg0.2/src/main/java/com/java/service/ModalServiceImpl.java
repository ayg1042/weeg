package com.java.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.item.ItemDto;
import com.java.entity.item.ItemEntity;
import com.java.repository.ModalRepository;

@Service
public class ModalServiceImpl implements ModalService {

	@Autowired ModalRepository modalRepsitory;
	
	@Override
	public List<ItemDto> getAllItems() {
		List<ItemEntity> list = modalRepsitory.findAll();
		List<ItemDto> Items = new ArrayList();
		for(ItemEntity entity : list) {
			Items.add(ItemDto.From(entity));
		}
		return Items;
	}

}
