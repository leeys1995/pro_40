package com.jslhrd.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PhotoVO {
	 private MultipartFile Filedata;
	 private String callback;
	 private String callback_func;
}
