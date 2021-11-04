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

public class ProdottoDAO {
	
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
	
	public List<Prodotto> getAllProducts(){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM `prodotto` WHERE disponibilità='si' ";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()) {
				Prodotto prodotto=new Prodotto();
				prodotto.setCodice(rs.getInt("codice"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto"));
				prodotto.setDisponibilità(rs.getString("disponibilità"));
				prodotto.setIva(rs.getInt("iva"));
				prodotto.setPrezzo_vendita(rs.getDouble("prezzo_vendita"));
				prodotto.setMarca(rs.getString("marca"));
				prodotto.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili"));
				prodotto.setSconto(rs.getInt("sconto"));
				prodotto.setSpecifiche(rs.getString("specifiche"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setOfferta(rs.getString("offerta"));
				prodotto.setImmagine(rs.getString("immagine"));
				
				prodotti.add(prodotto);
				
			}
		connection.close();
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return prodotti;
	}
	
	
	public int getAllProductsNumber(){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		int numero=0;
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM `prodotto` WHERE disponibilità='si' ";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()) {
				Prodotto prodotto=new Prodotto();
				prodotto.setCodice(rs.getInt("codice"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto"));
				prodotto.setDisponibilità(rs.getString("disponibilità"));
				prodotto.setIva(rs.getInt("iva.prodotto"));
				prodotto.setPrezzo_vendita(rs.getDouble("prezzo_vendita"));
				prodotto.setMarca(rs.getString("marca.prodotto"));
				prodotto.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili"));
				prodotto.setSconto(rs.getInt("sconto.prodotto"));
				prodotto.setSpecifiche(rs.getString("specifiche"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setOfferta(rs.getString("offerta"));
				prodotto.setImmagine(rs.getString("immagine"));
				
				prodotti.add(prodotto);
				numero++;
				
			}
			connection.close();
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return numero;
	}
	
	
	
	
	
	
	public List<Carrello> getProdottiCarrello(ArrayList<Carrello> listacarrello){
		List<Carrello> prodotticarrello= new ArrayList<Carrello>();
		
		try {
			
			
			if(listacarrello.size()>0) {
				for(Carrello prodotto:listacarrello) {
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					String sql = "SELECT * FROM prodotto WHERE codice=? and disponibilità='si'";
					connection = ds.getConnection();
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setInt(1, prodotto.getCodice());
					ResultSet rs = preparedStatement.executeQuery();
					
					while(rs.next()) {
						Carrello prodottoRiga=new Carrello();//sarebbe il prodotti visto in carrello.jsp ovvero il prodotto con il suo id,quantità e prezzo
						prodottoRiga.setCodice(rs.getInt("codice"));
						prodottoRiga.setNome(rs.getString("nome"));
						prodottoRiga.setDescrizione(rs.getString("descrizione"));
						prodottoRiga.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto"));
						prodottoRiga.setDisponibilità(rs.getString("disponibilità"));
						prodottoRiga.setIva(rs.getInt("iva"));
						prodottoRiga.setPrezzo_vendita(rs.getDouble("prezzo_vendita"));
						prodottoRiga.setMarca(rs.getString("marca"));
						prodottoRiga.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili"));
						prodottoRiga.setSconto(rs.getInt("sconto"));
						prodottoRiga.setSpecifiche(rs.getString("specifiche"));
						prodottoRiga.setTipo(rs.getString("tipo"));
						prodottoRiga.setOfferta(rs.getString("offerta"));
						prodottoRiga.setImmagine(rs.getString("immagine"));
						prodottoRiga.setQuantita(prodotto.getQuantita());
						
						prodotticarrello.add(prodottoRiga);
					}
					connection.close();
				}
			}
			
			
			
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return prodotticarrello;
	}
	
	
	
	
	public List<Prodotto> getAllProductsForCategory(String categoria){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE tipo='"+categoria+"' AND disponibilità='si'";	
			
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Prodotto prodotto=new Prodotto();
				prodotto.setCodice(rs.getInt("codice"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto"));
				prodotto.setDisponibilità(rs.getString("disponibilità"));
				prodotto.setIva(rs.getInt("iva"));
				prodotto.setPrezzo_vendita(rs.getDouble("prezzo_vendita"));
				prodotto.setMarca(rs.getString("marca"));
				prodotto.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili"));
				prodotto.setSconto(rs.getInt("sconto"));
				prodotto.setSpecifiche(rs.getString("specifiche"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setOfferta(rs.getString("offerta"));
				prodotto.setImmagine(rs.getString("immagine"));
				
				prodotti.add(prodotto);
				
			}
			connection.close();
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return prodotti;
	}
	
	public List<Prodotto> getAllProductsForCategoryAndMarca(String categoria,String marca){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();	
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE tipo='"+categoria+"'"+"AND marca='"+marca+"' AND disponibilità='si'";	
			
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Prodotto prodotto=new Prodotto();
				prodotto.setCodice(rs.getInt("codice"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto"));
				prodotto.setDisponibilità(rs.getString("disponibilità"));
				prodotto.setIva(rs.getInt("iva"));
				prodotto.setPrezzo_vendita(rs.getDouble("prezzo_vendita"));
				prodotto.setMarca(rs.getString("marca"));
				prodotto.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili"));
				prodotto.setSconto(rs.getInt("sconto"));
				prodotto.setSpecifiche(rs.getString("specifiche"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setOfferta(rs.getString("offerta"));
				prodotto.setImmagine(rs.getString("immagine"));
				
				prodotti.add(prodotto);			
			}
			connection.close();
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return prodotti;
	}
	
	
	public List<Prodotto> getAllProductsForNome(String nome){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE nome LIKE '%"+nome+"%' OR marca LIKE"+"'%"+nome+"%' AND disponibilità='si'";	
			
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Prodotto prodotto=new Prodotto();
				prodotto.setCodice(rs.getInt("codice"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto"));
				prodotto.setDisponibilità(rs.getString("disponibilità"));
				prodotto.setIva(rs.getInt("iva"));
				prodotto.setPrezzo_vendita(rs.getDouble("prezzo_vendita"));
				prodotto.setMarca(rs.getString("marca"));
				prodotto.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili"));
				prodotto.setSconto(rs.getInt("sconto"));
				prodotto.setSpecifiche(rs.getString("specifiche"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setOfferta(rs.getString("offerta"));
				prodotto.setImmagine(rs.getString("immagine"));
				
				prodotti.add(prodotto);			
			}
			connection.close();
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return prodotti;
	}
	
	
	public List<Prodotto> getAllProductsForSconto(){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE offerta='si' AND disponibilità='si'";	
			
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Prodotto prodotto=new Prodotto();
				prodotto.setCodice(rs.getInt("codice"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto"));
				prodotto.setDisponibilità(rs.getString("disponibilità"));
				prodotto.setIva(rs.getInt("iva"));
				prodotto.setPrezzo_vendita(rs.getDouble("prezzo_vendita"));
				prodotto.setMarca(rs.getString("marca"));
				prodotto.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili"));
				prodotto.setSconto(rs.getInt("sconto"));
				prodotto.setSpecifiche(rs.getString("specifiche"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setOfferta(rs.getString("offerta"));
				prodotto.setImmagine(rs.getString("immagine"));
				
				prodotti.add(prodotto);			
			}
			connection.close();
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return prodotti;
	}
	
	
	
	public double getTotaleCarrello(ArrayList<Carrello> listacarrello) {
		double totale=0;
		
try {					
			if(listacarrello.size()>0) {
				for(Carrello prodotto:listacarrello) {
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					String sql = "SELECT * FROM prodotto WHERE codice=?";
					connection = ds.getConnection();
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setInt(1, prodotto.getCodice());
					ResultSet rs = preparedStatement.executeQuery();
					
					while(rs.next()) {
						totale+=rs.getDouble("prezzo_vendita")*prodotto.getQuantita();
					}
					connection.close();
		} 
	}
}catch (SQLException e) {
			System.out.println("Errore");

		}
return totale;
}
	
	
	public List<Prodotto> getProductsForCodiced(int codice){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE codice='"+codice+"' AND disponibilità='si'";	
			
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Prodotto prodotto=new Prodotto();
				prodotto.setCodice(rs.getInt("codice"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto"));
				prodotto.setDisponibilità(rs.getString("disponibilità"));
				prodotto.setIva(rs.getInt("iva"));
				prodotto.setPrezzo_vendita(rs.getDouble("prezzo_vendita"));
				prodotto.setMarca(rs.getString("marca"));
				prodotto.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili"));
				prodotto.setSconto(rs.getInt("sconto"));
				prodotto.setSpecifiche(rs.getString("specifiche"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setOfferta(rs.getString("offerta"));
				prodotto.setImmagine(rs.getString("immagine"));
				
				prodotti.add(prodotto);
				
			}
			connection.close();
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return prodotti;
	}


}
