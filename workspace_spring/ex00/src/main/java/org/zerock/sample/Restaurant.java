package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.ToString;

//setter 주입
//생성자 주입
//필드 주입

@Component
@ToString
public class Restaurant {
 
	@Autowired
	private Chef chef;
}
