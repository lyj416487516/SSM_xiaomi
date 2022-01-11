package org.example.chapter03.scope;
//新建Singleton类型的bean

//import org.springframework.stereotype.Service;

//@Service
//public class DemoSingletonService {
//}

//因为Spring默认配置的Scope是Singleton，因此以上代码等价于以下代码：
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(ConfigurableBeanFactory.SCOPE_SINGLETON)//也可以写成@Scope("singleton")
public class DemoSingletonService {
}