package org.example.chapter02;

import static org.junit.Assert.*;

import org.junit.Rule;
import org.junit.Test;
import org.junit.contrib.java.lang.system.SystemOutRule;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)//在测试开始的时候自动创建Spring的应用上下文
@ContextConfiguration(classes = CDPlayerConfig.class)//告诉Spring需要在CDPlayerConfig中加载配置
public class CDPlayerTest {
    @Rule
    public final SystemOutRule log = new SystemOutRule();

    @Autowired
    private MediaPlayer mediaPlayer;

    @Autowired
    private CompactDisc compactDisc;

    @Test
    public void cdShouldNotBeNull() {
        assertNotNull(compactDisc);
        compactDisc.play();
    }

    @Test
    public void play() {
        mediaPlayer.play();
//        assertEquals("Playing Sgt.Pepper's Lonely Hearts Club Band By The Beatles\r\n", log.getLog());
    }
}