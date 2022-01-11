package org.example.chapter03.scope;
// 新建ProtoType类型的bean

import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)//也可以写成@Scope("prototype")
public class DemoPrototypeService {
}