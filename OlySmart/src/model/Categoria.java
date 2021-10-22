package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Categoria {
	
	private int numero;
	private String nome;
	
	
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
	
	
	public Categoria() {
		
	}
	
	
public Categoria(int numero,String nome) {
		this.numero=numero;
		this.nome=nome;
	}
	
	
	
	/**
	 * @return the numero
	 */
	public int getNumero() {
		return numero;
	}
	/**
	 * @param numero the numero to set
	 */
	public void setNumero(int numero) {
		this.numero = numero;
	}
	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}
	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	//metodo per inserire una categoria nel database
	public void setCategoria() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			String sql = "INSERT INTO categoria (`numero_prodotto.categoria`, `tipo.categoria`) VALUES (?, ?)";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, numero);
			preparedStatement.setString(2, nome);
			preparedStatement.executeUpdate();
			System.out.println("categoria inserita");

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
