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



public class ClienteDAO {
	
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
	

	public ClienteDAO() {

	}
	


	public boolean getUsernameAndPassword(Cliente cliente) {

		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			username = cliente.getUsername();
			password = cliente.getPassword();
			String sql = "SELECT * FROM `cliente` WHERE `username.cliente`='" + username + "' AND `password.cliente`='" + password + "'";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			boolean controllo = rs.next();

			if (!controllo) {
				System.out.println("Utente non è autentificato");
			} else {
				System.out.println("Utente è autentificato");
			}
			return controllo;
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return false;

	}
	
	
	public List<Cliente> getUtentiRegistrati() {
		List<Cliente> lista=new ArrayList<Cliente>();

		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			String sql = "SELECT * FROM `cliente`";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				Cliente clientelista=new Cliente();
				clientelista.setNome(rs.getString("nome.cliente"));
				clientelista.setCognome(rs.getString("cognome.cliente"));
				clientelista.setUsername(rs.getString("username.cliente"));
				clientelista.setEmail(rs.getString("email.cliente"));
				clientelista.setCap(rs.getString("cap.cliente"));
				clientelista.setVia(rs.getString("via.cliente"));
				clientelista.setCittà(rs.getString("città.cliente"));
				clientelista.setTelefono(rs.getString("telefono.cliente"));
				
				lista.add(clientelista);
			}
			
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return lista;

	}
	
	
		
	

	private String username;
	private String password;

}

