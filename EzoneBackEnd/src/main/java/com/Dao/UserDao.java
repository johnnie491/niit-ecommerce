package com.Dao;

import com.model.*;

public interface UserDao{
	public boolean addUser(User user);

	public User getUser(String email);

}
