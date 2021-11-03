package model;

public class Ordine{

	public Ordine() {
		
	}
	
	private int codice;
	private int numero;
	private double costo_totale;
	private String data;
	private double prezzo_prodotto_singolo;
	private String username;
	private String tipo_spedizione;
	private int quantità_prodotto;
	private String indirizzo_consegna;
	/**
	 * @return the codice
	 */
	public int getCodice() {
		return codice;
	}
	/**
	 * @param codice the codice to set
	 */
	public void setCodice(int codice) {
		this.codice = codice;
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
	 * @return the costo_totale
	 */
	public double getCosto_totale() {
		return costo_totale;
	}
	/**
	 * @param costo_totale the costo_totale to set
	 */
	public void setCosto_totale(double costo_totale) {
		this.costo_totale = costo_totale;
	}
	/**
	 * @return the data
	 */
	public String getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(String data) {
		this.data = data;
	}
	/**
	 * @return the prezzo_prodotto_singolo
	 */
	public double getPrezzo_prodotto_singolo() {
		return prezzo_prodotto_singolo;
	}
	/**
	 * @param prezzo_prodotto_singolo the prezzo_prodotto_singolo to set
	 */
	public void setPrezzo_prodotto_singolo(double prezzo_prodotto_singolo) {
		this.prezzo_prodotto_singolo = prezzo_prodotto_singolo;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the tipo_spedizione
	 */
	public String getTipo_spedizione() {
		return tipo_spedizione;
	}
	/**
	 * @param tipo_spedizione the tipo_spedizione to set
	 */
	public void setTipo_spedizione(String tipo_spedizione) {
		this.tipo_spedizione = tipo_spedizione;
	}
	/**
	 * @return the quantità_prodotto
	 */
	public int getQuantità_prodotto() {
		return quantità_prodotto;
	}
	/**
	 * @param quantità_prodotto the quantità_prodotto to set
	 */
	public void setQuantità_prodotto(int quantità_prodotto) {
		this.quantità_prodotto = quantità_prodotto;
	}
	/**
	 * @return the indirizzo_consegna
	 */
	public String getIndirizzo_consegna() {
		return indirizzo_consegna;
	}
	/**
	 * @param indirizzo_consegna the indirizzo_consegna to set
	 */
	public void setIndirizzo_consegna(String indirizzo_consegna) {
		this.indirizzo_consegna = indirizzo_consegna;
	}
	
	
	
}
