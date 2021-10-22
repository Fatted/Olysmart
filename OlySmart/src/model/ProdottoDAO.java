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
			String sql = "SELECT * FROM prodotto";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()) {
				Prodotto prodotto=new Prodotto();
				prodotto.setCodice(rs.getInt("codice.prodotto"));
				prodotto.setNome(rs.getString("nome.prodotto"));
				prodotto.setDescrizione(rs.getString("descrizione.prodotto"));
				prodotto.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto.prodotto"));
				prodotto.setDisponibilità(rs.getString("disponibilità.prodotto"));
				prodotto.setIva(rs.getInt("iva.prodotto"));
				prodotto.setPrezzo_vendita(rs.getDouble("prezzo_vendita.prodotto"));
				prodotto.setMarca(rs.getString("marca.prodotto"));
				prodotto.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili.prodotto"));
				prodotto.setSconto(rs.getInt("sconto.prodotto"));
				prodotto.setSpecifiche(rs.getString("specifiche.prodotto"));
				prodotto.setTipo(rs.getString("tipo.prodotto"));
				prodotto.setOfferta(rs.getString("offerta.prodotto"));
				prodotto.setImmagine(rs.getString("immagine.prodotto"));
				
				prodotti.add(prodotto);
				
			}
		
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return prodotti;
	}
	
	
	
	
	
	
	public List<Carrello> getProdottiCarrello(ArrayList<Carrello> listacarrello){
		List<Carrello> prodotticarrello= new ArrayList<Carrello>();
		
		try {
			
			
			if(listacarrello.size()>0) {
				for(Carrello prodotto:listacarrello) {
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					String sql = "SELECT * FROM prodotto WHERE 'codice.prodotto'=?";
					connection = ds.getConnection();
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setInt(1, prodotto.getCodice());
					ResultSet rs = preparedStatement.executeQuery();
					
					while(rs.next()) {
						Carrello prodottoRiga=new Carrello();				//sarebbe il prodotti visto in carrello.jsp ovvero il prodotto con il suo id,quantità e prezzo
						prodottoRiga.setCodice(rs.getInt("codice.prodotto"));
						prodottoRiga.setNome(rs.getString("nome.prodotto"));
						prodottoRiga.setDescrizione(rs.getString("descrizione.prodotto"));
						prodottoRiga.setPrezzo_acquisto(rs.getDouble("prezzo_acquisto.prodotto"));
						prodottoRiga.setDisponibilità(rs.getString("disponibilità.prodotto"));
						prodottoRiga.setIva(rs.getInt("iva.prodotto"));
						prodottoRiga.setPrezzo_vendita(rs.getDouble("prezzo_vendita.prodotto"));
						prodottoRiga.setMarca(rs.getString("marca.prodotto"));
						prodottoRiga.setNumero_pezzi_disponibili(rs.getInt("numero_pezzi_disponibili.prodotto"));
						prodottoRiga.setSconto(rs.getInt("sconto.prodotto"));
						prodottoRiga.setSpecifiche(rs.getString("specifiche.prodotto"));
						prodottoRiga.setTipo(rs.getString("tipo.prodotto"));
						prodottoRiga.setOfferta(rs.getString("offerta.prodotto"));
						prodottoRiga.setImmagine(rs.getString("immagine.prodotto"));
						
						prodotticarrello.add(prodottoRiga);
					}
				}
			}
			
			
			
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return prodotticarrello;
	}

}
