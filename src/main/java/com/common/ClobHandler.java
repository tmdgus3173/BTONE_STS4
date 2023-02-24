
package com.common;

import java.io.StringReader;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class ClobHandler implements TypeHandler	{


	@Override
	public Object getResult(CallableStatement arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getResult(ResultSet arg0, int arg1) throws SQLException {
		return arg0.getString(arg1);
	}

	@Override
	public Object getResult(ResultSet arg0, String arg1) throws SQLException {		
		return arg0.getString(arg1);
	}

	@Override
	public void setParameter(PreparedStatement arg0, int i, Object arg2, JdbcType arg3) throws SQLException {
		String s = (String)arg2;
		StringReader reader = new StringReader(s);		
		arg0.setCharacterStream(i, reader, s.length());		
	}

}
