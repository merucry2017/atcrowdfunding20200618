package com.atcrowdfunding.manager.service.impl;

import com.atcrowdfunding.bean.User;
import com.atcrowdfunding.exception.LoginFailException;
import com.atcrowdfunding.manager.dao.UserMapper;
import com.atcrowdfunding.manager.service.UserService;
import com.atcrowdfunding.util.Const;
import com.atcrowdfunding.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User queryUserlogin(Map<String, Object> paramMap) {

        User user = userMapper.queryUserlogin(paramMap);
        if(user==null){
            throw new LoginFailException("用户账号或密码不正确");
        }
        return user;
    }

    /**
     * 保存用户
     * @param user
     * @return
     */
    @Override
    public Integer saveUser(User user) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");

        Date now = new Date();

        String createtime = sdf.format(now);

        user.setCreatetime(createtime);

        user.setUserpswd(Const.PASSWORD);

        return userMapper.insert(user);
    }

    @Override
    public Page queryPage(Map<String, Object> paramMap) {
        Page page = new Page((Integer) paramMap.get("pageno"), (Integer) paramMap.get("pagesize"));

        Integer startIndex = page.getStartIndex();
        paramMap.put("startIndex", startIndex);
        List<User> datas = userMapper.queryList(paramMap);
        page.setDatas(datas);

        Integer totalsize = userMapper.queryCount(paramMap);
        page.setTotalsize(totalsize);

        return page;
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer updateUser(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    @Override
    public Integer deleteUser(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Integer deleteBatchUser(Integer[] ids) {
        int totalCount = 0;
        for (Integer id: ids){
            int count = userMapper.deleteByPrimaryKey(id);
            totalCount += count;
        }
        if(totalCount!=ids.length){
            throw new RuntimeException("批量删除失败");
        }
        return totalCount;
    }

//    /**
//     * 刷新页
//     * @param pageno
//     * @param pagesize
//     * @return
//     */
//    @Override
//    public Page queryPage(Integer pageno, Integer pagesize) {
//
//        Page page = new Page(pageno,pagesize);
//
//        Integer startIndex = page.getStartIndex();
//
//        List<User> datas = userMapper.queryList(startIndex,pagesize);
//
//        page.setDatas(datas);
//
//        Integer totalsize = userMapper.queryCount();
//
//        page.setTotalsize(totalsize);
//
//        return page;
//    }


}
