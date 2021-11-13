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
			
			String sql = "INSERT INTO ordine (`codice`, `costo_totale`, `data`, `prezzo_singolo_prodotto`, `username`, `tipo_spedizione`, `quantità_prodotto`, `indirizzo_consegna`,`nome_prodotto`) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?); ";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, ordine.getCodice());
			preparedStatement.setDouble(2, ordine.getCosto_totale());
			preparedStatement.setString(3, ordine.getData());
			preparedStatement.setDouble(4, ordine.getPrezzo_prodotto_singolo());
			preparedStatement.setString(5, ordine.getUsername());
			preparedStatement.setString(6, ordine.getTipo_spedizione());
			preparedStatement.setInt(7, ordine.getQuantità_prodotto());
			preparedStatement.setString(8, ordine.getIndirizzo_consegna());
			preparedStatement.setString(9, ordine.getNome_prodotto());
			
			
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {			
			System.out.println(e);		
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
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
				ordine.setQuantità_prodotto(rs.getInt("quantità_prodotto"));
				ordine.setIndirizzo_consegna(rs.getString("indirizzo_consegna"));
				ordine.setNome_prodotto(rs.getString("nome_prodotto"));
				
				listaordini.add(ordine);		
			}
								
		} catch (SQLException e) {			
			System.out.println(e);		
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			}
		
		return listaordini;
		
	}
	
	
	//metodo usato per stampare tutti gli ordini effetuati dal cliente con un determinato username,ritorniamo una lista di ordini,visibile in MyOrder.jsp
	public List<Ordine> ordini(){
		List<Ordine> listaordini=new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
try {
			
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
				ordine.setQuantità_prodotto(rs.getInt("quantità_prodotto"));
				ordine.setIndirizzo_consegna(rs.getString("indirizzo_consegna"));
				ordine.setNome_prodotto(rs.getString("nome_prodotto"));
				
				listaordini.add(ordine);		
			}
								
		} catch (SQLException e) {			
			System.out.println(e);		
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			}
		
		return listaordini;
		
	}
	
	
	

}
