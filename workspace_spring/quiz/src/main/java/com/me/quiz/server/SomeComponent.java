package com.me.quiz.server;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SomeComponent {
	
	private final StartupPy startupPy;
	
	@Autowired
	public SomeComponent(StartupPy startupPy) {
		this.startupPy = startupPy;
	}
	
	//원하는 시점에 initialize 메서드 호출
	public void someMethod() {
		startupPy.initialize();
	}
}
