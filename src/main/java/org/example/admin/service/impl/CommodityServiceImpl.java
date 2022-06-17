package org.example.admin.service.impl;

import org.example.admin.service.CommodityService;
import org.example.shopping.bean.Classify;
import org.example.shopping.bean.Shops;
import org.example.shopping.mapper.ClassifyMapper;
import org.example.shopping.mapper.ShopMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class CommodityServiceImpl implements CommodityService {

    @Autowired
    private ShopMapper shopMapper;

    @Autowired
    private ClassifyMapper classifyMapper;

    @Override
    public List<Shops> findAll(String name) {
        return shopMapper.selectAllShop(name);
    }

    @Override
    public List<Classify> findClassify() {
        return classifyMapper.findClassify();
    }

    @Override
    public Shops findShopById(Integer id) {
        return shopMapper.findShopById(id);
    }

    @Override
    @Transactional
    public Integer save(MultipartFile multipartFile, Shops shops, Integer save) {

        //获取上传文件的文件名字
        String imgName = multipartFile.getOriginalFilename();
        //获取文件名字的后缀
        String contextType = imgName.substring(imgName.lastIndexOf("."));
        //创建新的文件名字
        String newName = new Date().getTime()+contextType;
        //保存图片的路径，图片上传成功后，将路径保存到数据库
        String comPath = "/JavaDome/WorkSpace/SpringTest/web/image/";
        String filePath = comPath + newName;

        File file = new File(filePath);
        // 获取父文件
        File parent = file.getParentFile();
        // 若不存在创建父文件夹
        if (!parent.exists()) {
            parent.mkdirs();
        }

        //声明输入流， 进行图片传输
        InputStream is = null;
        OutputStream os = null;
        try {
             is = multipartFile.getInputStream();
            //指定输出图片的位置
             os = new FileOutputStream(new File(filePath));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        //定义byte数组
        byte[] buffer = new byte[1024];
        int len = 0;
        try {
            while(true) {
                    if (!((len=is.read(buffer))!=-1)) break;
                os.write(buffer, 0, len);
                os.flush();
            }
            os.close();
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 保存到数据库
        shops.setImage(newName);
        Integer result = 0;
        if (save == 1) {
            result = shopMapper.save(shops);
        } else {
            result = shopMapper.update(shops);
        }
        return result;
    }

}
