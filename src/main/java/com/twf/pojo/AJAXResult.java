package com.twf.pojo;

/**
 * 异步数据Bean
 */
public class AJAXResult {

	private boolean success;
	private Object data;
	
	
	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	
}
