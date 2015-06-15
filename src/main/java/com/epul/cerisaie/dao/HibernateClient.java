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
		} catch (Exception ex) {
			
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			
			throw new MonException("Erreur  Hibernate: ",ex.getMessage());
		}
		return mesApprenants;
	}

	public Apprenant getUneLigne(int num) throws ServiceHibernateException ,Exception{
		boolean trouve = false;
		Apprenant unApprenant = null;
		try {
			mesApprenants = getTouteslesLignes();
			int i =0;
			while (i < mesApprenants.size() && !trouve) {
				unApprenant = mesApprenants.get(i);
				if (unApprenant.getNumapprenant() == num)
					trouve = true;
				i++;
			}
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (Exception ex) {
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return unApprenant;
	}

	public void ajouter(Apprenant unApprenant) throws HibernateException,
			ServiceHibernateException {
		Transaction tx = null;
		try {
			session = ServiceHibernate.currentSession();
			tx = session.beginTransaction();
			// on transf�re l'apprenant � la base
			session.save(unApprenant);
			tx.commit();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
			// on remonte l'erreur
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
	}

	public void modifier(Apprenant unApprenant) throws Exception,
			ServiceHibernateException {

		Transaction tx = null;
		try {
			// il faut fermer la session courante pour
			// lib�rer l'objet que l'on veut modifier
			ServiceHibernate.closeSession();
			session = ServiceHibernate.currentSession();
			tx = session.beginTransaction();
			session.update(unApprenant.getObtients());
			session.update(unApprenant);
			tx.commit();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
			// on remonte l'erreur
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
	}


	public void effacer(String[] tabnum) throws Exception,
			ServiceHibernateException {
		Transaction tx = null;
		for (int i = 0; i < tabnum.length; i++) {
			try {
				// il faut fermer la session courante pour
				// lib�rer l'objet que l'on veut modifier
				ServiceHibernate.closeSession();
				session = ServiceHibernate.currentSession();
				tx = session.beginTransaction();

				Apprenant unApprenant = new Apprenant();
				unApprenant = getUneLigne(Integer.parseInt(tabnum[i]));
				session.delete(unApprenant.getObtients());
				session.delete(unApprenant);
				tx.commit();
			} catch (ServiceHibernateException ex) {
				throw new ServiceHibernateException(
						"Erreur de service Hibernate: " + ex.getMessage(), ex);
			} catch (Exception ex) {
				if (tx != null) {
					tx.rollback();
				}
				// on remonte l'erreur
				throw new MonException("Erreur  Hibernate: ", ex.getMessage());
			}
		}
	}
}
