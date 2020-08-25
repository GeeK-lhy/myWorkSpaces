package com.oracle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.User;
@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);


    User selectByPrimaryKey(@Param("job_number")String job_number );


    
    User selectByAccountName(@Param("account_name")String account_name);
    
   void addUser(User user);
   
   void addPower(@Param("account_name")String account_name);
   void deletePower(@Param("account_name")String account_name);
   List<User> selectAllUser();
}