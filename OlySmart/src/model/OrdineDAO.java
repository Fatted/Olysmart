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

public class OrdineDAO {

	
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
	
	//metodo usato per inserire nel db un ordine prendendo i valori dall'ordine passato come parametro
	public void inserimentoOrdine(Ordine ordine) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			
			String sql = "INSERT INTO ordine (`codice`, `costo_totale`, `data`, `prezzo_singolo_prodotto`, `username`, `tipo_spedizione`, `quantit�_prodotto`, `indirizzo_consegna`,`nome_prodotto`,`stato`,`prodotto_codice`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?); ";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, ordine.getCodice());
			preparedStatement.setDouble(2, ordine.getCosto_totale());
			preparedStatement.setString(3, ordine.getData());
			preparedStatement.setDouble(4, ordine.getPrezzo_prodotto_singolo());
			preparedStatement.setString(5, ordine.getUsername());
			preparedStatement.setString(6, ordine.getTipo_spedizione());
			preparedStatement.setInt(7, ordine.getQuantit�_prodotto());
			preparedStatement.setString(8, ordine.getIndirizzo_consegna());
			preparedStatement.setString(9, ordine.getNome_prodotto());
			preparedStatement.setString(10, "preso in carico");
			preparedStatement.setInt(11, ordine.getProdotto_codice());
			
			
			preparedStatement.executeUpdate();
			connection.close();
			
		} catch (SQLException e) {			
			System.out.println(e);		
				
			}
	}
	
	
	
	//metodo usato per stampare tutti gli ordini effetuati dal cliente con un determinato username,ritorniamo una lista di ordini,visibile in MyOrder.jsp
	public List<Ordine> ordineUtente(String username){
		List<Ordine> listaordini=new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
try {
			
			String sql = "SELECT * FROM ordine WHERE username=? ";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);		
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				Ordine ordine=new Ordine();
				ordine.setCodice(rs.getInt("codice"));
				ordine.setCosto_totale(rs.getDouble("costo_totale"));
				ordine.setData(rs.getString("data"));
				ordine.setPrezzo_prodotto_singolo(rs.getDouble("prezzo_singolo_prodotto"));
				ordine.setUsername(rs.getString("username"));
				ordine.setTipo_spedizione(rs.getString("tipo_spedizione"));
				ordine.setQuantit�_prodotto(rs.getInt("quantit�_prodotto"));
				ordine.setIndirizzo_consegna(rs.getString("indirizzo_consegna"));
				ordine.setNome_prodotto(rs.getString("nome_prodotto"));
				ordine.setStato(rs.getString("stato"));
				ordine.setProdotto_codice(rs.getInt("prodotto_codice"));
				
				
				listaordini.add(ordine);		
				
			}
			connection.close();					
		} catch (SQLException e) {			
			System.out.println(e);		
		}
		
		return listaordini;
		
	}
	
	
	//metodo usato per stampare tutti gli ordini effetuati dal cliente con un determinato username,ritorniamo una lista di ordini,visibile in MyOrder.jsp
	public List<Ordine> ordini(){
		List<Ordine> listaordini=new ArrayList<>();
		
		
try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM ordine";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);		
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				Ordine ordine=new Ordine();
				ordine.setCodice(rs.getInt("codice"));
				ordine.setCosto_totale(rs.getDouble("costo_totale"));
				ordine.setData(rs.getString("data"));
				ordine.setPrezzo_prodotto_singolo(rs.getDouble("prezzo_singolo_prodotto"));
				ordine.setUsername(rs.getString("username"));
				ordine.setTipo_spedizione(rs.getString("tipo_spedizione"));
				ordine.setQuantit�_prodotto(rs.getInt("quantit�_prodotto"));
				ordine.setIndirizzo_consegna(rs.getString("indirizzo_consegna"));
				ordine.setNome_prodotto(rs.getString("nome_prodotto"));
				ordine.setStato(rs.getString("stato"));
				ordine.setProdotto_codice(rs.getInt("prodotto_codice"));
				
				listaordini.add(ordine);		
				
			}
			connection.close();					
		} catch (SQLException e) {			
			System.out.println(e);		
		}
			
		
		return listaordini;
		
	}
	
	
	
	public void UpdateOrdineStato(int codice,String stato){

		try {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql = "UPDATE ordine SET stato=? WHERE codice="+codice;
		connection = ds.getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1,stato);

		preparedStatement.executeUpdate();

		connection.close();
		
	}catch (SQLException e) {
		System.out.println(e);

	}
}


	
	public List<Ordine> ordineCambiamento(int codice){
		List<Ordine> listaordini=new ArrayList<>();
try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM ordine WHERE codice=? ";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, codice);		
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				Ordine ordine=new Ordine();
				ordine.setCodice(rs.getInt("codice"));
				ordine.setCosto_totale(rs.getDouble("costo_totale"));
				ordine.setData(rs.getString("data"));
				ordine.setPrezzo_prodotto_singolo(rs.getDouble("prezzo_singolo_prodotto"));
				ordine.setUsername(rs.getString("username"));
				ordine.setTipo_spedizione(rs.getString("tipo_spedizione"));
				ordine.setQuantit�_prodotto(rs.getInt("quantit�_prodotto"));
				ordine.setIndirizzo_consegna(rs.getString("indirizzo_consegna"));
				ordine.setNome_prodotto(rs.getString("nome_prodotto"));
				ordine.setStato(rs.getString("stato"));
				ordine.setProdotto_codice(rs.getInt("prodotto_codice"));
				
				listaordini.add(ordine);
			}
			connection.close();					
		} catch (SQLException e) {			
			System.out.println(e);		
		}

		return listaordini;
		
	}
	
	

}