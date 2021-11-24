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
	
	
	//metodo che restituisce tutti i prodotti
	public List<Prodotto> getAllProducts(){
		List<Prodotto> prodotti=new ArrayList<Prodotto>(); //creo una lista di prodotti
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM `prodotto` WHERE numero_pezzi_disponibili>0 "; //seleziono i prodotti nel db con disponibilità maggiore di 0
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()) {
				Prodotto prodotto=new Prodotto(); //creo un nuovo prodotto dove setterò i valori che prenderò dal db
				prodotto.setCodice(rs.getInt("codice")); //setto il codice del prodotto prendendolo dal db,dalla colonna codice
				prodotto.setNome(rs.getString("nome"));	//setto il nome del prodotto prendendolo dal db,dalla colonna nome
				prodotto.setDescrizione(rs.getString("descrizione"));//così vai per tutti i valori 
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
	
	
	
	
	
	
	public List<Prodotto> getAllProductsAdmin(){
		List<Prodotto> prodotti=new ArrayList<Prodotto>(); //creo una lista di prodotti
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM `prodotto`"; //seleziono i prodotti nel db con disponibilità maggiore di 0
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next()) {
				Prodotto prodotto=new Prodotto(); //creo un nuovo prodotto dove setterò i valori che prenderò dal db
				prodotto.setCodice(rs.getInt("codice")); //setto il codice del prodotto prendendolo dal db,dalla colonna codice
				prodotto.setNome(rs.getString("nome"));	//setto il nome del prodotto prendendolo dal db,dalla colonna nome
				prodotto.setDescrizione(rs.getString("descrizione"));//così vai per tutti i valori 
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
			System.out.println(e);

		}
		return prodotti;
	}
	
	
	//metodo che restituisce un numero corrispondente alla quantità di prodotti presenti nel database
	public int getAllProductsNumber(){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		int numero=0;
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM `prodotto` WHERE numero_pezzi_disponibili>0 ";
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
	
	
	
	
	
	//metodo che ritorna una lista contenente i prodotti inseriti nel carrello
	public List<Carrello> getProdottiCarrello(ArrayList<Carrello> listacarrello){
		List<Carrello> prodotticarrello= new ArrayList<Carrello>();
		
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
	
	
	
	//metodo che ritorna una lista di prodotti selezionati per categorie all'interno del db,ovviamente gli viene passata la categoria come parametro,che poi useremo nella query
	public List<Prodotto> getAllProductsForCategory(String categoria){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE tipo='"+categoria+"' AND numero_pezzi_disponibili>0";	
			
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
	
	
	//metodo che ritorna una lista di prodotti selezionati per categorie e marca all'interno del db,ovviamente gli viene passata la categoria e la marca come parametro,che poi useremo nella query	
	public List<Prodotto> getAllProductsForCategoryAndMarca(String categoria,String marca){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();	
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE tipo='"+categoria+"'"+"AND marca='"+marca+"' AND numero_pezzi_disponibili>0";	
			
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
	
	
	//metodo che ritorna una lista di prodotti selezionati per nome all'interno del db,ovviamente gli viene passato il nome come parametro,che poi useremo nella query	
	public List<Prodotto> getAllProductsForNome(String nome){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE nome LIKE '%"+nome+"%' OR marca LIKE"+"'%"+nome+"%' AND numero_pezzi_disponibili>0";	
			
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
	
	
	
	//metodo che ritorna una lista di prodotti selezionati per seconti="si" all'interno del db,viene usato nella homepage per vedere i prodotti in offerta	
	public List<Prodotto> getAllProductsForSconto(){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE offerta='si' AND numero_pezzi_disponibili>0";	
			
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
	
	
//metodo che prendendo un arraylist di oggetti carrello,effettua la somma di tutti i prezzi_vendita*quantità dei singoli prodotti per ottenre il totale del carrello	
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
	
	
//metodo che ritorna il prodotto avente il codice passato
	public List<Prodotto> getProductsForCodice(int codice){
		List<Prodotto> prodotti=new ArrayList<Prodotto>();
		
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM prodotto WHERE codice='"+codice+"'";	
			
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

	
//metodo usato per diminuire la quantià del prodotto all'interno del db dopo che è stato effettuato l'ordine,prendo sia la quantità da rimuovere sia il codice del prodotto al quale sottrarre la quantità
	public void rimuoviquantitaprodotto(int codice,int darimuovere) {
	
		try {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql="UPDATE prodotto SET numero_pezzi_disponibili=? WHERE codice='"+codice+"'";
		connection = ds.getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1,darimuovere);
		
		preparedStatement.executeUpdate();

		connection.close();
		} catch (SQLException e) {
			System.out.println(e);

		}
	}
	
	
	
//metodo che viene usato dall'admin per modificare i valori dei prodotti
	public void UpdateProdottoDescrizione(int codice,String descrizione){

		try {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String sql = "UPDATE prodotto SET descrizione=? WHERE codice="+codice;
		connection = ds.getConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1,descrizione);

		preparedStatement.executeUpdate();

		connection.close();
		
	}catch (SQLException e) {
		System.out.println(e);

	}
}
	
	
	//metodo che viene usato dall'admin per modificare i valori dei prodotti
		public void UpdateProdottoNome(int codice,String nome){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET nome=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,nome);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}
		
		public void UpdateProdottoPrezzoAcquisto(int codice,double prezzo){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET prezzo_acquisto=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setDouble(1,prezzo);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}
		
	
		public void UpdateProdottoDisponibilita(int codice,String disponibilita){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET disponibilità=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,disponibilita);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}
		
		public void UpdateProdottoIva(int codice,int iva){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET iva=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,iva);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}
		
		public void UpdateProdottoPrezzoVendita(int codice,double prezzo){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET prezzo_vendita=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setDouble(1,prezzo);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}
		
		public void UpdateProdottoMarca(int codice,String marca){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET marca=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,marca);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}
		
		public void UpdateProdottoPezziDisponibili(int codice,int numero_pezzi){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET numero_pezzi_disponibili=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,numero_pezzi);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}

		
		public void UpdateProdottoSconto(int codice,int sconto){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET sconto=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,sconto);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}

		
		public void UpdateProdottoSpecifiche(int codice,String specifiche){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET specifiche=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,specifiche);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}
		
		public void UpdateProdottoCategoria(int codice,String categoria){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET tipo=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,categoria);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}
		
		public void UpdateProdottoOfferta(int codice,String offerta){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "UPDATE prodotto SET offerta=? WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,offerta);

			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}
		
		public void UpdateProdottoEliminazione(int codice){

			try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "DELETE FROM prodotto WHERE codice="+codice;
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
		
			preparedStatement.executeUpdate();

			connection.close();
			
		}catch (SQLException e) {
			System.out.println(e);

		}
	}

	
}
