package spring.project.tcat.config;

import java.io.Reader;
import java.sql.Connection;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Configuration {
	private static SqlSession sqlSession;
	private static Connection conn;
	
	static {
		try {
			
			Reader reader=Resources.getResourceAsReader("config/sqlMapConfig.xml");
			SqlSessionFactory sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
			sqlSession=sqlSessionFactory.openSession(ExecutorType.REUSE,false);
			conn=sqlSession.getConnection();
			conn.setAutoCommit(true);
			reader.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static <T>T getMapper(Class<T> arg){
		return sqlSession.getMapper(arg);
	}
}
