package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Recensione {
	
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

	private String usernameCliente;
	private int codiceProdotto;
	private String commento;
	private String titolo;
	private int voto;
	
	
	public Recensione() {
		
	}
	
	
	public Recensione(String usernameCliente,int codiceProdotto,String titolo,String commento,int voto) {
		this.usernameCliente=usernameCliente;
		this.codiceProdotto=codiceProdotto;
		this.commento=commento;
		this.voto=voto;
		this.titolo=titolo;
	}

	/**
	 * @return the usernameCliente
	 */
	public String getUsernameCliente() {
		return usernameCliente;
	}

	/**
	 * @param usernameCliente the usernameCliente to set
	 */
	public void setUsernameCliente(String usernameCliente) {
		this.usernameCliente = usernameCliente;
	}

	/**
	 * @return the codiceProdotto
	 */
	public int getCodiceProdotto() {
		return codiceProdotto;
	}

	/**
	 * @param codiceProdotto the codiceProdotto to set
	 */
	public void setCodiceProdotto(int codiceProdotto) {
		this.codiceProdotto = codiceProdotto;
	}

	/**
	 * @return the commento
	 */
	public String getCommento() {
		return commento;
	}

	/**
	 * @param commento the commento to set
	 */
	public void setCommento(String commento) {
		this.commento = commento;
	}

	/**
	 * @return the voto
	 */
	public int getVoto() {
		return voto;
	}

	/**
	 * @param voto the voto to set
	 */
	public void setVoto(int voto) {
		this.voto = voto;
	}
	
	/**
	 * @return the titolo
	 */
	public String getTitolo() {
		return titolo;
	}

	/**
	 * @param titolo the titolo to set
	 */
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	
	public void setRecensione() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			String sql="INSERT INTO recensione (username_cliente,codice_prodotto,titolo,commento,voto) VALUES (?, ?, ?, ?,?)";
			connection=ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, usernameCliente);
			preparedStatement.setInt(2, codiceProdotto);
			preparedStatement.setString(3, titolo);
			preparedStatement.setString(4, commento);
			preparedStatement.setInt(5, voto);
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null)
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			} finally {

				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		}
	}
	
	
}
