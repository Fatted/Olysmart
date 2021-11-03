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

public class SpedizioneDAO {
	
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
	
	
	public List<Spedizione> getSpedizioni() {
		List<Spedizione> listaSpedizioni=new ArrayList<Spedizione>();

		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			String sql = "SELECT * FROM spedizione";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				Spedizione spedizione=new Spedizione();
				spedizione.setTipo(rs.getString("Tipo"));
				spedizione.setCosto(rs.getInt("Costo"));
				spedizione.setTempo(rs.getString("Tempo"));
				
				listaSpedizioni.add(spedizione);
			}
			
			connection.close();
		
			
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return listaSpedizioni;
		

	}
	
}
