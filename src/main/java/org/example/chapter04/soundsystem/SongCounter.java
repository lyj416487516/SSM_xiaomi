package org.example.chapter04.soundsystem;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import java.util.HashMap;
import java.util.Map;

@Aspect
public class SongCounter {
    private Map<Integer, Integer> songCounts = new HashMap<>();

    /**
     * 可重用的切点
     *
     * @param songNumber
     * 重点关注下切点表达式execution(* chapter04.soundsystem.CompactDisc.play(int)) && args(songNumber)，其中int代表参数类型，songNumber代表参数名称。
     */
    @Pointcut("execution(* org.example.chapter04.soundsystem.CompactDisc.play(int)) && args(songNumber)")
    public void songPlayed(int songNumber) {
    }

    @Before("songPlayed(songNumber)")
    public void countSong(int songNumber) {
        System.out.println("播放歌曲计数：" + songNumber);
        int currentCount = getPlayCount(songNumber);
        songCounts.put(songNumber, currentCount + 1);
    }

    /**
     * 获取歌曲播放次数
     *
     * @param songNumber
     * @return
     */
    public int getPlayCount(int songNumber) {
        return songCounts.getOrDefault(songNumber, 0);
    }
}