package com.srp.controller;

import com.srp.util.LayuiResponseResult;
import com.srp.util.WangEditorResponseResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.UUID;

@RestController
public class UploadController {
    /**
     * 社团申请
     *
     * @param file    上传的文件
     * @param session 请求
     * @return 是否上传成功
     * @throws Exception 抛出异常
     */
    @PostMapping("/file/upload")
    public Object upload(HttpSession session, @RequestParam("file") MultipartFile file) {
        //标识是否上传成功
        boolean bool = false;
        //获取要上传的目标文件夹绝对路径、webapp下
//        ServletContext context = session.getServletContext();
//        String realPath = context.getRealPath("/upload");
        String realPath = "C:/upload";
        String needPath = "../upload";
        //重新定义文件名、避免名称重复
        String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 15) + "_file_" + file.getOriginalFilename();
        String path = "";
        try {
            //上传文件至指定位置
            file.transferTo(new File(realPath + "/" + fileName));
            path = needPath + "/" + fileName;
            bool = true;
            System.out.println("path路径为:"+path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (bool){
            return LayuiResponseResult.renderSuccess(path,1);
        }else {
            return LayuiResponseResult.renderSuccess("fail",1);
        }

    }

    /**
     * 活动发布
     *
     * @param file    上传的文件
     * @param session 请求
     * @return 是否上传成功
     * @throws Exception 抛出异常
     */
    @PostMapping("/activity/upload")
    public Object activityUpload(HttpSession session, @RequestParam("file") MultipartFile file) {
        //标识是否上传成功
        boolean bool = false;
        //获取要上传的目标文件夹绝对路径、webapp下
        ServletContext context = session.getServletContext();
        String realPath = context.getRealPath("/upload");

        //重新定义文件名、避免名称重复
        String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 15) + "_file_" + file.getOriginalFilename();
        try {
            //上传文件至指定位置
            file.transferTo(new File(realPath + "/" + fileName));
            bool = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (bool){
            return "success";
        }else {
            return "false";
        }
    }

    /**
     * WangEditor
     *
     * @param file    上传的文件
     * @param session 请求
     * @return 是否上传成功
     * @throws Exception 抛出异常
     */
    @PostMapping("/wangEditor/upload")
    public Object wangEditorUpload(HttpSession session, @RequestParam("file") MultipartFile file) {
        //标识是否上传成功
        int errno = 1;
        //获取要上传的目标文件夹绝对路径、webapp下
        ServletContext context = session.getServletContext();
        String realPath = context.getRealPath("/upload");

        //重新定义文件名、避免名称重复
        String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 15) + "_file_" + file.getOriginalFilename();
        String path = "";
        try {
            //上传文件至指定位置
            file.transferTo(new File(realPath + "/" + fileName));
            path = "http://localhost:8080/upload" + "/" + fileName;
            errno = 0;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return WangEditorResponseResult.renderSuccess(path,errno);
    }


}
