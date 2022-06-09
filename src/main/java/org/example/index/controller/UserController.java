package org.example.index.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="users")
public class UserController {
//    //静态List<User>集合，此处代替数据库用来保存注册的用户信息
//    private static List<User> userList;
//    //UserController类的构造器，初始化List<User>集合
//    public UserController(){
//        super();
//        userList = new ArrayList<User>();
//    }
//    @RequestMapping(value="/register",method= RequestMethod.GET)
//    public String register(){
//        return "users/register";
//    }
//
//    @RequestMapping(value="/registerForm",method=RequestMethod.POST)
//    public String registerForm(@RequestParam("loginname")String loginname,
//                           @RequestParam("password")String password){
//        //创建user对象
//        User user = new User();
//        user.setLoginname(loginname);
//        user.setPassword(password);
//        //模拟数据库存储User信息
//        userList.add(user);
//        return "users/login";
//    }
//
//    @RequestMapping(value="/login",method= RequestMethod.GET)
//    public String login(){
//        return "users/login";
//    }
//
//    //登录
//    @RequestMapping(value = "/loginForm",method=RequestMethod.POST)
//    public String loginFrom(@RequestParam("loginname")String loginname,
//                        @RequestParam("password")String password, Model model){
//        //到集合中查找用户是否存在，此处用来模拟数据库验证
//        for(User user:userList){
//            if(user.getLoginname().equals(loginname) && user.getPassword().equals(password)){
//                model.addAttribute("message", user);
//                return "index";
//            }
//        }
//        return "users/login";
//    }

}