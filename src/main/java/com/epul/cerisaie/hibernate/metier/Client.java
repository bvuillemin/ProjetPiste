package com.epul.cerisaie.hibernate.metier;

// Generated 21 f�vr. 2015 16:48:28 by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Client generated by hbm2java
 */
@Entity
@Table(name = "client", catalog = "cerisaie")
public class Client implements java.io.Serializable {

	private Integer numCli;
	private String nomCli;
	private String adrRueCli;
	private String cpCli;
	private String villeCli;
	private String pieceCli;
	private String numPieceCli;
	private List<Sejour> sejours = new ArrayList<Sejour>();

	public Client() {
	}

	public Client(String nomCli, String adrRueCli, String cpCli,
			String villeCli, String pieceCli, String numPieceCli,  List<Sejour> sejours) {
		this.nomCli = nomCli;
		this.adrRueCli = adrRueCli;
		this.cpCli = cpCli;
		this.villeCli = villeCli;
		this.pieceCli = pieceCli;
		this.numPieceCli = numPieceCli;
		this.sejours = sejours;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "NumCli", unique = true, nullable = false)
	public Integer getNumCli() {
		return this.numCli;
	}

	public void setNumCli(Integer numCli) {
		this.numCli = numCli;
	}

	@Column(name = "NomCli", length = 30)
	public String getNomCli() {
		return this.nomCli;
	}

	public void setNomCli(String nomCli) {
		this.nomCli = nomCli;
	}

	@Column(name = "AdrRueCli", length = 40)
	public String getAdrRueCli() {
		return this.adrRueCli;
	}

	public void setAdrRueCli(String adrRueCli) {
		this.adrRueCli = adrRueCli;
	}

	@Column(name = "CpCli", length = 5)
	public String getCpCli() {
		return this.cpCli;
	}

	public void setCpCli(String cpCli) {
		this.cpCli = cpCli;
	}

	@Column(name = "VilleCli", length = 40)
	public String getVilleCli() {
		return this.villeCli;
	}

	public void setVilleCli(String villeCli) {
		this.villeCli = villeCli;
	}

	@Column(name = "PieceCli", length = 10)
	public String getPieceCli() {
		return this.pieceCli;
	}

	public void setPieceCli(String pieceCli) {
		this.pieceCli = pieceCli;
	}

	@Column(name = "NumPieceCli", length = 20)
	public String getNumPieceCli() {
		return this.numPieceCli;
	}

	public void setNumPieceCli(String numPieceCli) {
		this.numPieceCli = numPieceCli;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "client")
	public  List<Sejour> getSejours() {
		return this.sejours;
	}

	public void setSejours( List<Sejour> sejours) {
		this.sejours = sejours;
	}

}
