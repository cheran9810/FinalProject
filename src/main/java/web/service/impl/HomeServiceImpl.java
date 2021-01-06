package web.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.HomeDao;
import web.dto.Product;
import web.service.face.HomeService;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired private HomeDao homeDao;

	@Override
	public List<HashMap<String, Object>> selectProduct() {

		return homeDao.selectList();
	}
	
}
