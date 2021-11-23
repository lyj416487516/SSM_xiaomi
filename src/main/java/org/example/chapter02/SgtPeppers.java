package org.example.chapter02;

import org.springframework.stereotype.Component;

import javax.inject.Named;

//使用@Component设置bean ID
@Component("lonelyHeartsClub")//表明该类会作为组件类，并告知Spring要为这个类创建bean
// 使用@Named设置bean ID
//@Named("lonelyHeartsClub")
public class SgtPeppers implements CompactDisc{
    @Override
    public void play() {
        String title = "Sgt.Pepper's Lonely Hearts Club Band";
        String artists = "The Beatles";
        System.out.println("Playing " + title + " By " + artists);
    }
}
