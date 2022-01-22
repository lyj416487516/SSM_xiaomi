package org.example.chapter03.ambiguity;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
@Qualifier("iceCream")//
public class IceCream implements Dessert {
    @Override
    public void showName() {
        System.out.println("冰激凌");
    }
}