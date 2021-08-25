package com.srp.controller;

import com.alibaba.fastjson.JSON;
import com.srp.bean.User;
import com.srp.service.UserService;
import com.srp.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

@RestController
public class UserController {
    @Autowired
    private UserService service;

    @GetMapping("/uPhoto/{uId}")
    public String getuPhoto(@PathVariable int uId) {
        return JSON.toJSONString(service.getuPhoto(uId));
    }

    private UserServiceImpl userService = new UserServiceImpl();

    /**
     * @param httpSession
     * @param uStuNumber
     * @param uPassword
     * @return String
     * @description 用户登录
     * @version v1.0.0
     * @author heiye
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpSession httpSession, HttpServletRequest request, @RequestParam("uStuNumber") String uStuNumber, @RequestParam("uPassword") String uPassword) {

        ModelAndView mv = new ModelAndView();
        String[] user = userService.loginService(uStuNumber, uPassword);
        /***
         * user[0]  uName
         * user[1]  uPhoto
         * user[2] uId
         *
         */
        if (user[0] != null) {
            //创建session
            httpSession.setAttribute("uName", user[0]);
            httpSession.setAttribute("uPhoto", user[1]);
            httpSession.setAttribute("uId", user[2]);
            //跳转到个人页面
            mv.setViewName("redirect:/html/main_index.html?uId=" + user[2] + "");
        } else {
            //登陆失败
            mv.setViewName("login");    //返回到登陆页面
        }

        return mv;
    }

    /**
     * 普通管理员登录
     */
    @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
    public ModelAndView adminLogin(HttpSession httpSession, @RequestParam("uStuNumber") String uStuNumber, @RequestParam("uPassword") String uPassword) throws SQLException {
        ModelAndView mv = new ModelAndView();
        RedirectAttributes attribute = null;
        String cId_uId[] = userService.adminLoginService(uStuNumber,uPassword);
        httpSession.setAttribute("cId", cId_uId[0]);
        httpSession.setAttribute("uId", cId_uId[1]);
//        attribute.addAttribute("cId", cId_uId[0]);
//        attribute.addAttribute("uId", cId_uId[1]);
        mv.setViewName("redirect:/html/club.html?cId=" + cId_uId[0] + "&uId=" + cId_uId[1]);
        return mv;
    }


    /**
     * 超级管理员登录
     */

    @RequestMapping(value = "/superLogin", method = RequestMethod.POST)
    public ModelAndView superLogin(HttpSession httpSession, @RequestParam("uStuNumber") String uStuNumber, @RequestParam("uPassword") String uPassword) throws SQLException {
        ModelAndView mv = new ModelAndView();
        RedirectAttributes attribute = null;
        boolean successful = userService.superLoginService(uStuNumber,uPassword);

        if (successful) {
            mv.setViewName("redirect:/html/supper.html");
        } else {
            mv.setViewName("login");
        }

        return mv;
    }


    /**
     * @param
     * @return String
     * @description 用户注册
     * @author heiye
     * @version v1.0.0
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(
            HttpServletRequest request,
            @RequestParam("uName") String uName,
            @RequestParam("uStuNumber") String uStuNumber,
            @RequestParam("uSex") String uSex,
            @RequestParam("uCollege") String uCollege,
            @RequestParam("uCurrentMajor") String uCurrentMajor,
            @RequestParam("uEnrolTime") String uEnrolTime,
            @RequestParam("phone") String phone,
            @RequestParam("qq") String qq,
            @RequestParam("uPassword") String uPassword,
            @RequestParam("uPhoto") MultipartFile file
    ) throws ParseException, IOException, SQLException {

        //首先上传文件
        //标识是否上传成功
        boolean bool = false;
        //获取要上传的目标文件夹绝对路径、webapp下
//        ServletContext context = session.getServletContext();
//        String realPath = context.getRealPath("/upload");
        String realPath = "C:/apache-tomcat-9.0.37-windows-x64/apache-tomcat-9.0.37/webapps/srp/upload";
        String needPath = "../upload";
        //重新定义文件名、避免名称重复
        String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 15) + "_file_" + file.getOriginalFilename();
        String path = "";
        try {
            //上传文件至指定位置
            file.transferTo(new File(realPath + "/" + fileName));
            path = needPath + "/" + fileName;
            bool = true;
            System.out.println("path路径为:" + path);
        } catch (IOException e) {
            e.printStackTrace();
        }





        ModelAndView mv = new ModelAndView();

        LocalDate date = null;
        date = LocalDate.parse(uEnrolTime);
        User u = new User(uStuNumber, uName, uSex, uCollege, uCurrentMajor, date, phone, qq, uPassword);
        boolean registerSuccess = userService.registerService(u);
        if (registerSuccess==true){
            //获取到uId;
            int uId =userService.getUIdService(uStuNumber);
            //把图片路径写入数据库里面
            userService.writeImgToUploadService(uId, path);
            //注册成功直接跳转到我的个人中心页面
            mv.addObject("message", "注册成功");
        } else{
            mv.addObject("message", "注册失败");
        }





        mv.setViewName("login");

        return mv;
    }

    /**
     * @param httpSession,u
     * @param u
     * @return
     * @description 更新用户信息
     * @author heiye
     * @version v1.0.0
     */
    @RequestMapping(value = "/updateUserInfo", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String updateUserInfo(HttpSession httpSession, @ModelAttribute User u) {
        ModelAndView mv = new ModelAndView();
        if (httpSession != null) {
            String message = userService.updateUserInfoService(u);
            if (message.contains("成功"))
                return "{\"message\":\"修改成功\"}";
            else
                return "{\"message\":\"修改失败\"}";
        } else {
            mv.setViewName("login");
            return "{\"message\":\"先登录，再修改信息\"}";
        }
    }

    /**
     * 获取某一个用户的详细信息
     */

    @RequestMapping(value = "/userInfo/{uName}", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView userInfo(@PathVariable("uName") String uName, HttpSession session) throws SQLException {
        ModelAndView mv = new ModelAndView();
        if ((session != null && session.getAttribute("uName").equals(uName)) || uName != null) {
            User user = userService.userInfoService(uName);
            mv.addObject("user", user);

            session.setAttribute("uName",user.getuName());
            session.setAttribute("uStuNumber",user.getuStuNumber());
            session.setAttribute("uSex",user.getuSex());
            session.setAttribute("uCollege",user.getuCollege());
            session.setAttribute("uCurrentMajor",user.getuCurrentMajor());
            session.setAttribute("uEnrolTime",user.getuEnrolTime());
            session.setAttribute("phone",user.getuPhoto());
            session.setAttribute("qq",user.getQq());
            mv.setViewName("index");
        } else {
            mv.setViewName("login");
        }

        return mv;
    }

}
