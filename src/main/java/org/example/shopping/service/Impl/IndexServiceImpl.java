package org.example.shopping.service.Impl;

import org.example.shopping.bean.Classify;
import org.example.shopping.dao.IndexDao;
import org.example.shopping.mapper.ClassifyMapper;
import org.example.shopping.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    public IndexDao indexDao;

    @Override
    public List<Classify> classFindAll() {
        return indexDao.classFindAll();
    }
}
