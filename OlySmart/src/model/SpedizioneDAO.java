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
	
	
	//metodo che ritorna le categorie disponibili nel database all'interno di una lista
	public List<Spedizione> getSpedizioni() {
		List<Spedizione> listaSpedizioni=new ArrayList<Spedizione>();

		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			String sql = "SELECT * FROM spedizione";//seleziono tutto dalla tabella spedizione del db
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				Spedizione spedizione=new Spedizione();
				spedizione.setTipo(rs.getString("Tipo"));//setto il tipo di spedizione il cui valore lo prendo dal db dove la colonna ha nome "tipo"
				spedizione.setCosto(rs.getInt("Costo"));//setto il costo di spedizione il cui valore lo prendo dal db dove la colonna ha nome "costo"
				spedizione.setTempo(rs.getString("Tempo"));//setto il tempo di spedizione il cui valore lo prendo dal db dove la colonna ha nome "tempo"
				
				listaSpedizioni.add(spedizione);//metto tutto nella lista delle spedizioni che poi ritornerò
			}
			
			connection.close();
		
			
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return listaSpedizioni;		
	}
	
	
	
	
	
	//metodo usato per stampare tutti gli ordini effetuati dal cliente con un determinato username,ritorniamo una lista di ordini,visibile in MyOrder.jsp
	public String getSpedizioneTipo(int costo){
		String tipo=null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
try {
			
			String sql = "SELECT Tipo FROM spedizione where costo="+costo;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);		
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
			tipo=rs.getString("Tipo");
			}
			
			connection.close();
								
		} catch (SQLException e) {			
			System.out.println(e);		
					
	}

return tipo;
	}



}
	

