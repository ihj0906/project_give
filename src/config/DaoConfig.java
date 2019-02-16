package config;

import java.beans.PropertyVetoException;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import dao.GiveDao;
import dao.MemberDao;
import dao.MypageDao;
import dao.NoteDao;
import dao.QnaDao;
import service.GiveService;
import service.LoginService;
import service.MemberService;
import service.MessageService;
import service.MypageService;
import service.QnaService;

//스프링기반 동적bean 생성 및 관리

@Configuration
public class DaoConfig {

	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		try {
			ds.setDriverClass("com.mysql.jdbc.Driver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
/*		ds.setJdbcUrl("jdbc:mysql://192.168.0.21:3306/team3");
		ds.setUser("team3");
		ds.setPassword("team3");*/

		ds.setJdbcUrl("jdbc:mysql://localhost:3306/team3");
		ds.setUser("root");
		ds.setPassword("oracle");

		return ds;
	}

	@Bean
	public MemberDao memberDao() {
		return new MemberDao(dataSource());
	}

	@Bean
	public MemberService memberSvc() {
		return new MemberService(memberDao());
	}

//	@Bean
//	public LoginService memberLoginSvc() {
//		return new LoginService(memberDao());
//	}

	@Bean
	public NoteDao noteDao() {
		return new NoteDao(dataSource());
	}

	@Bean
	public MessageService messageSvc() {
		return new MessageService(noteDao());
	}

	@Bean
	public QnaDao qnaDao() {
		return new QnaDao(dataSource());
	}

	@Bean
	public QnaService qnaSvc() {
		return new QnaService(qnaDao());
	}


	@Bean
	public GiveDao giveDao() {
		return new GiveDao(dataSource());
	}

	@Bean
	public GiveService giveSvc() {
		return new GiveService(giveDao());
	}

	@Bean
	public MypageDao mypageDao() {
		return new MypageDao(dataSource());
	}

	@Bean
	public MypageService mypageSvc() {
		return new MypageService(mypageDao());
	}

}
