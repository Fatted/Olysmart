package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CategoriaDAO {
	
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/olysmart_database");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	public List<Categoria> getCategorie() {
		List<Categoria> lista=new ArrayList<Categoria>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM categoria";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Categoria categoria=new Categoria();
				categoria.setNumero(rs.getInt("numero_prodotto.categoria"));
				categoria.setNome(rs.getString("tipo.categoria"));
				
				lista.add(categoria);
			}
			
		}catch (SQLException e) {
			System.out.println("Errore");

		}
		return lista;
	}
}
