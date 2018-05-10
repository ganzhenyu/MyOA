package myoa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myoa.biz.FunctionBiz;
import myoa.dao.FunctionDao;
import myoa.entity.Function;

@Service
public class FunctionBizImpl implements FunctionBiz{

	@Autowired
	private FunctionDao fd;
	
	@Override
	public List<Function> getFunctionParent() {
		// TODO Auto-generated method stub
		return fd.getFunctionParent();
	}

	@Override
	public List<Function> getFunctionZi() {
		// TODO Auto-generated method stub
		return fd.getFunctionZi();
	}

}
