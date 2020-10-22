package mlt.boot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mlt.boot.entity.FileEntity;
import mlt.boot.mapper.FileMapper;
import mlt.boot.mapper.MenuMapper;

@Service
public class FileService {
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private MenuMapper menuMapper;
	
	public void saveFile(FileEntity entity) {
		menuMapper.saveFile(entity);
	}
	
	public FileEntity findByid(long id) {
		return fileMapper.findByid(id);
		
	}

	public List<FileEntity> findAll() {
		return fileMapper.findAll();
	}

}
