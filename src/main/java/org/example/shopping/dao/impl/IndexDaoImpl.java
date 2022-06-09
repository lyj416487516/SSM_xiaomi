package org.example.shopping.dao.impl;

import org.example.shopping.bean.Classify;
import org.example.shopping.dao.IndexDao;
import org.example.shopping.mapper.ClassifyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class IndexDaoImpl implements IndexDao {

    @Autowired
    public ClassifyMapper classifyMapper;

    @Override
    public List<Classify> classFindAll() {
        return classifyMapper.findAll();
    }
}
