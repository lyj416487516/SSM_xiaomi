package org.example.chapter03.ambiguity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class DessertShop {
    private Dessert dessert;

    public Dessert getDessert() {
        return dessert;
    }

    @Autowired
    @Qualifier("iceCream")//在有多个@Primary时使用指定bean
    public void setDessert(Dessert dessert) {
        this.dessert = dessert;
    }

    public void showDessertName() {
        this.dessert.showName();
    }
}