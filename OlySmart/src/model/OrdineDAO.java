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
	
	public void inserimentoOrdine(Ordine ordine) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			
			String sql = "INSERT INTO ordine (`codice`, `numero`, `costo_totale`, `data`, `prezzo_singolo_prodotto`, `username`, `tipo_spedizione`, `quantità_prodotto`, `indirizzo_consegna`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?); ";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, ordine.getCodice());
			preparedStatement.setInt(2, ordine.getNumero());
			preparedStatement.setDouble(3, ordine.getCosto_totale());
			preparedStatement.setString(4, ordine.getData());
			preparedStatement.setDouble(5, ordine.getPrezzo_prodotto_singolo());
			preparedStatement.setString(6, ordine.getUsername());
			preparedStatement.setString(7, ordine.getTipo_spedizione());
			preparedStatement.setInt(8, ordine.getQuantità_prodotto());
			preparedStatement.setString(9, ordine.getIndirizzo_consegna());
			
			
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
}
