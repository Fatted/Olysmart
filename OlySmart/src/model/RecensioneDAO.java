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

public class RecensioneDAO {
	
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

	
	
	public List<Recensione> recensioni(){
		List<Recensione> listarecensioni=new ArrayList<>();
		
		
try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM recensione";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);		
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				Recensione recensione=new Recensione();
				recensione.setUsernameCliente(rs.getString("username_cliente"));
				recensione.setCodiceProdotto(rs.getInt("codice_prodotto"));
				recensione.setTitolo(rs.getString("titolo"));
				recensione.setCommento(rs.getString("commento"));
				recensione.setVoto(rs.getInt("voto"));
				
				listarecensioni.add(recensione);
			}
			connection.close();					
		} catch (SQLException e) {			
			System.out.println(e);		
		}
			
		
		return listarecensioni;
		
	}
	
	
	public List<Recensione> recensioneProdotto(int codice){
		List<Recensione> listarecensioni=new ArrayList<>();
		
		
try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM recensione where codice_prodotto="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);		
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				Recensione recensione=new Recensione();
				recensione.setUsernameCliente(rs.getString("username_cliente"));
				recensione.setCodiceProdotto(rs.getInt("codice_prodotto"));
				recensione.setTitolo(rs.getString("titolo"));
				recensione.setCommento(rs.getString("commento"));
				recensione.setVoto(rs.getInt("voto"));
				
				listarecensioni.add(recensione);
			}
			connection.close();					
		} catch (SQLException e) {			
			System.out.println(e);		
		}
			
		
		return listarecensioni;
		
	}
	
	
	public List<Recensione> recensioneProdottoCliente(String username){
		List<Recensione> listarecensioni=new ArrayList<>();
		
		
try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM recensione where username_cliente="+"'"+username+"'";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);		
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				Recensione recensione=new Recensione();
				recensione.setUsernameCliente(rs.getString("username_cliente"));
				recensione.setCodiceProdotto(rs.getInt("codice_prodotto"));
				recensione.setTitolo(rs.getString("titolo"));
				recensione.setCommento(rs.getString("commento"));
				recensione.setVoto(rs.getInt("voto"));
				
				listarecensioni.add(recensione);
			}
			connection.close();					
		} catch (SQLException e) {			
			System.out.println(e);		
		}
			
		
		return listarecensioni;
		
	}
	
}