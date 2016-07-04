//package com.pknu.bbs;
//
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
////JUnit 을 pom.xml 에 import 해야 사용가능.
//
//import com.pknu.bbs.dao.BBSDao;
//
//@RunWith(SpringJUnit4ClassRunner.class)
////@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
//@ContextConfiguration(locations={"classpath:spring/*.xml"})
//public class TestBBSController {
//	@Autowired
//	BBSDao bbsDao;
//	
//	
//	//Before annotation
//	@Before
//	public void test(){
//		System.out.println("Start : Before Annotation");
//	}
//	
//	@Test
//	public void getArticleCount(){
//		System.out.print("글 갯수 : ");
//		System.out.println(bbsDao.getArticleCount());
//		System.out.println("Test Annotation");
//	}
//
//}
