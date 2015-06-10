package com.epul.cerisaie.hibernate.metier_old;

// Generated 21 f�vr. 2015 16:48:28 by Hibernate Tools 4.3.1

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Sejour generated by hbm2java
 */
@Entity
@Table(name = "sejour", catalog = "cerisaie")
public class Sejour implements java.io.Serializable {

	private Integer numSej;
	private Client client;
	private Emplacement emplacement;
	private Date datedebSej;
	private Date dateFinSej;
	private Integer nbPersonnes;
	private List<Activite> activites = new  ArrayList<Activite>();

	public Sejour() {
	}

	public Sejour(Client client, Emplacement emplacement) {
		this.client = client;
		this.emplacement = emplacement;
	}

	public Sejour(Client client, Emplacement emplacement, Date datedebSej,
			Date dateFinSej, Integer nbPersonnes, List<Activite> activites) {
		this.client = client;
		this.emplacement = emplacement;
		this.datedebSej = datedebSej;
		this.dateFinSej = dateFinSej;
		this.nbPersonnes = nbPersonnes;
		this.activites = activites;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "NumSej", unique = true, nullable = false)
	public Integer getNumSej() {
		return this.numSej;
	}

	public void setNumSej(Integer numSej) {
		this.numSej = numSej;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NumCli", nullable = false)
	public Client getClient() {
		return this.client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NumEmpl", nullable = false)
	public Emplacement getEmplacement() {
		return this.emplacement;
	}

	public void setEmplacement(Emplacement emplacement) {
		this.emplacement = emplacement;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DatedebSej", length = 10)
	public Date getDatedebSej() {
		return this.datedebSej;
	}

	public void setDatedebSej(Date datedebSej) {
		this.datedebSej = datedebSej;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DateFinSej", length = 10)
	public Date getDateFinSej() {
		return this.dateFinSej;
	}

	public void setDateFinSej(Date dateFinSej) {
		this.dateFinSej = dateFinSej;
	}

	@Column(name = "NbPersonnes")
	public Integer getNbPersonnes() {
		return this.nbPersonnes;
	}

	public void setNbPersonnes(Integer nbPersonnes) {
		this.nbPersonnes = nbPersonnes;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "sejour")
	public List<Activite> getActivites() {
		return this.activites;
	}

	public void setActivites(List<Activite> activites) {
		this.activites = activites;
	}

}