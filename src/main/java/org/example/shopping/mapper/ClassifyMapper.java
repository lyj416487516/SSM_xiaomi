package org.example.shopping.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.example.shopping.bean.Classify;

import java.util.List;

@Mapper
public interface ClassifyMapper {

    /**
     * 查询所有分类及推荐商品
     * @return
     */
    List<Classify> findAll();

    /**
     * 查询所有分类
     * @return
     */
    List<Classify> findClassify();

}
