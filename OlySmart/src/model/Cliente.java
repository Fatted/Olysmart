package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Cliente {
	
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
	
	private static final String TABLE_NAME = "cliente";

	public Cliente() {
		
	}

	public Cliente(String nome, String cognome, String datadinascita, String codicefiscale, String email, String password, String username, String telefono, 
			String cap, String via, String città, String tipo) {
	super();
	this.nome=nome;
	this.cognome=cognome;
	this.datadinascita=datadinascita;
	this.codicefiscale=codicefiscale;
	this.email=email;
	this.password=password;
	this.username=username;
	this.telefono=telefono;
	this.cap=cap;
	this.via=via;
	this.città=città;
	this.tipo=tipo;
	
	
	}
	
	
	//metodo per controllare se il cliente è presente nel database
	public boolean controllocliente() {
		try {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			username = this.getUsername();

			String sql = "SELECT * FROM cliente WHERE username='"+ username +"'";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();

			boolean controllo = rs.next();

			if (!controllo) {
				System.out.println("Utente non presente");
			} else {
				System.out.println("Utente gìà presente");
			}
			return controllo;
		} catch (SQLException e) {
			System.out.println("Errore");

		}
		return true;

	}
	
	
	//metodo per inserire un cliente nel database
	public void setCliente() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			String sql = "INSERT INTO cliente (nome, cognome, data_di_nascita, codice_fiscale, email, password, username, telefono, cap, via, città, tipo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, nome);
			preparedStatement.setString(2, cognome);
			preparedStatement.setString(3, datadinascita);
			preparedStatement.setString(4, codicefiscale);
			preparedStatement.setString(5, email);
			preparedStatement.setString(6, password);
			preparedStatement.setString(7, username);
			preparedStatement.setString(8, telefono);
			preparedStatement.setString(9, cap);
			preparedStatement.setString(10, via);
			preparedStatement.setString(11, città);
			preparedStatement.setString(12, tipo);

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
	
	
	//metodo per restituire il cliente registrato
	public void getCliente() {
			Connection connection = null;
			PreparedStatement preparedStatement = null;

			try {
				String sql = "SELECT * FROM "+ TABLE_NAME+ " WHERE username='"+ username + "'";

				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(sql);
				
				ResultSet rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					this.setNome(rs.getString(1));
					this.setCognome(rs.getString(2));
					this.setDatadinascita(rs.getString(3));
					this.setCodicefiscale(rs.getString(4));
					this.setEmail( rs.getString(5));
					this.setPassword(rs.getString(6));
					this.setUsername(rs.getString(7));
					this.setTelefono(rs.getString(8));
					this.setCap(rs.getString(9));
					this.setVia(rs.getString(10));
					this.setCitta(rs.getString(11));
					this.setTipo(rs.getString(12));
					
				}
				
				
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
	

	public static DataSource getDs() {
		return ds;
	}



	public static void setDs(DataSource ds) {
		Cliente.ds = ds;
	}



	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}



	public String getCognome() {
		return cognome;
	}


	public void setCognome(String cognome) {
		this.cognome = cognome;
	}


	public String getDatadinascita() {
		return datadinascita;
	}


	public void setDatadinascita(String datadinascita) {
		this.datadinascita = datadinascita;
	}


	public String getCodicefiscale() {
		return codicefiscale;
	}


	public void setCodicefiscale(String codicefiscale) {
		this.codicefiscale = codicefiscale;
	}


	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}


	
	public void setPassword(String password) {
		this.password = password;
	}


	
	public String getUsername() {
		return username;
	}


	
	public void setUsername(String username) {
		this.username = username;
	}


	
	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	
	public String getCap() {
		return cap;
	}


	
	public void setCap(String cap) {
		this.cap = cap;
	}


	
	public String getVia() {
		return via;
	}


	
	public void setVia(String via) {
		this.via = via;
	}


	
	public String getCitta() {
		return città;
	}


	
	public void setCitta(String città) {
		this.città = città;
	}


	
	public String getTipo() {
		return tipo;
	}


	
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public boolean getValido() {
		return valido;
	}

	public void setValido(boolean valido) {
		this.valido = valido;
	}



	private String nome;
	private String cognome;
	private String datadinascita;
	private String codicefiscale;
	private String email;
	private String password;
	private String username;
	private String telefono;
	private String cap;
	private String via;
	private String città;
	private String tipo;
	private String numero_carta;
	private String data_scadenza_carta;
	private String CVV;
	private String Intestatario_carta;
	
	/**
	 * @return the numero_carta
	 */
	public String getNumero_carta() {
		return numero_carta;
	}

	/**
	 * @param numero_carta the numero_carta to set
	 */
	public void setNumero_carta(String numero_carta) {
		this.numero_carta = numero_carta;
	}

	/**
	 * @return the data_scadenza_carta
	 */
	public String getData_scadenza_carta() {
		return data_scadenza_carta;
	}

	/**
	 * @param data_scadenza_carta the data_scadenza_carta to set
	 */
	public void setData_scadenza_carta(String data_scadenza_carta) {
		this.data_scadenza_carta = data_scadenza_carta;
	}

	/**
	 * @return the cVV
	 */
	public String getCVV() {
		return CVV;
	}

	/**
	 * @param cVV the cVV to set
	 */
	public void setCVV(String cVV) {
		CVV = cVV;
	}

	/**
	 * @return the intestatario_carta
	 */
	public String getIntestatario_carta() {
		return Intestatario_carta;
	}

	/**
	 * @param intestatario_carta the intestatario_carta to set
	 */
	public void setIntestatario_carta(String intestatario_carta) {
		Intestatario_carta = intestatario_carta;
	}


	
	private boolean valido;

}
