package org.example.chapter04.log;

import org.springframework.stereotype.Service;

@Service
public class MockService {
    @AccessLog//如果某个方法不需要记录日志，可以不添加@AccessLog注解
    public String mockMethodOne(int index) {
        return index + "MockService.mockMethodOne";
    }

    @AccessLog//也可以指定recordLog为false@AccessLog(recordLog = false)
    public String mockMethodTwo(int index) {
        return index + "MockService.mockMethodTwo";
    }
}