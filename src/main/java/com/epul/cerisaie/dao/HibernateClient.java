package com.epul.cerisaie.dao;

import com.epul.cerisaie.hibernate.metier.Apprenant;
import com.epul.cerisaie.hibernate.metier.Mission;
import org.hibernate.*;

import com.epul.cerisaie.service.ServiceHibernate;
import com.epul.cerisaie.gestiondeserreurs.MonException;
import com.epul.cerisaie.gestiondeserreurs.ServiceHibernateException;

import java.util.*;

public class HibernateClient {
	
	
	private List<Apprenant> mesApprenants = null;
	private Session session;

	// On r�cup�re toutes les lignes de la table dans une liste
	/*
	 * (non-Javadoc)
	 * 
	 * @see hibernate.service.InterfaceHibrnateStage#getTouteslesLignes()
	 */

	public List<Apprenant> getTouteslesLignes() throws HibernateException,
			ServiceHibernateException {
		try {
			System.out.println("Get toutes les lignes :Je vais lire le fichier de conf ");
			session = ServiceHibernate.currentSession();
			// On passe une requ�te de type SQL mlais on travaille sur la classe
			Query query = session.createQuery("SELECT s  FROM Apprenant AS s");
			mesApprenants =  (List<Apprenant>) query.list();
			System.out.println(mesApprenants.toString());
		} catch (Exception ex) {
			
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			
			throw new MonException("Erreur  Hibernate: ",ex.getMessage());
		}
		return mesApprenants;
	}
}
