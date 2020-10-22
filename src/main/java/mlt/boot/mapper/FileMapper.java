package mlt.boot.mapper;

import java.util.List;

import mlt.boot.entity.FileEntity;

public interface FileMapper {
	void saveFile(FileEntity entity);
	FileEntity findByid(long id);
	List<FileEntity> findAll();
}
