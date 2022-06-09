package org.example.shopping.bean;

import java.util.List;

public class Classify {

    private Integer id;

    private String name;

    private Integer order;

    private Integer enable;

    private List<Shops> shopsList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public List<Shops> getShopsList() {
        return shopsList;
    }

    public void setShopsList(List<Shops> shopsList) {
        this.shopsList = shopsList;
    }
}
