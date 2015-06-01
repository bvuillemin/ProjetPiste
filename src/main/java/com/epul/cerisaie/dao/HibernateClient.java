package com.epul.cerisaie.dao;

import org.hibernate.*;

import com.epul.cerisaie.service.ServiceHibernate;
import com.epul.cerisaie.gestiondeserreurs.MonException;
import com.epul.cerisaie.gestiondeserreurs.ServiceHibernateException;
import com.epul.cerisaie.hibernate.metier.*;

import java.util.*;

public class HibernateClient {
	
	
	private List<Client> mesClients = null;
	private Session session;

	// On récupère toutes les lignes de la table dans une liste
	/*
	 * (non-Javadoc)
	 * 
	 * @see hibernate.service.InterfaceHibrnateStage#getTouteslesLignes()
	 */

	public List<Client> getTouteslesLignes() throws HibernateException,
			ServiceHibernateException {
		try {
			System.out.println("Get toutes les lignes :Je vais lire le fichier de conf ");
			session = ServiceHibernate.currentSession();
			// On passe une requête de type SQL mlais on travaille sur la classe
			Query query = session.createQuery("SELECT s  FROM Client AS s");
			mesClients =  (List<Client>) query.list();
		} catch (Exception ex) {
			
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			
			throw new MonException("Erreur  Hibernate: ",ex.getMessage());
		}
		return mesClients;
	}

	// On récupère une ligne avec une clé

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * hibernate.service.InterfaceHibrnateStage#getUneLigne(java.lang.String)
	 */

	public Client getUneLigne(int num) throws ServiceHibernateException ,Exception{
		boolean trouve = false;
		Client unClient = null;
		try {
			mesClients = getTouteslesLignes();
            int i =0;
			while (i < mesClients.size() && !trouve) {
				unClient = mesClients.get(i);
				if (unClient.getNumCli() == num)
					trouve = true;
				i++;
			}
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (Exception ex) {
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return unClient;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see bdmysql.InterfaceHibernateStage#create(hibernate.bd.Client)
	 */
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * hibernate.lecture.InterfaceHibernateStage#create(hibernate.mabd.Client)
	 */
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * hibernate.service.InterfaceHibrnateStage#ajouter(hibernate.metier.Client)
	 */

	public void ajouter(Client unClient) throws Exception,
			ServiceHibernateException {
		Transaction tx = null;
		try {
			session = ServiceHibernate.currentSession();
			tx = session.beginTransaction();
			// on transfère le Client à la base
			session.save(unClient);
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * hibernate.service.InterfaceHibrnateStage#modifier(hibernate.metier.Client)
	 */

	public void modifier(Client unClient) throws Exception,
			ServiceHibernateException {

		Transaction tx = null;
		try {
			// il faut fermer la session courante pour
			// libérer l'objet que l'on veut modifier
			ServiceHibernate.closeSession();
			session = ServiceHibernate.currentSession();
			tx = session.beginTransaction();
			session.update(unClient);
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

	// --------------------------------------------------------

	/*
	 * (non-Javadoc)
	 * 
	 * @see hibernate.service.InterfaceHibrnateStage#effacer(java.lang.String[])
	 */

	public void effacer(String[] tabnum) throws Exception,
			ServiceHibernateException {
		Transaction tx = null;
		for (int i = 0; i < tabnum.length; i++) {
			try {
				// il faut fermer la session courante pour
				// libérer l'objet que l'on veut modifier
				ServiceHibernate.closeSession();
				session = ServiceHibernate.currentSession();
				tx = session.beginTransaction();

				Client unClient = new Client();
				unClient = getUneLigne(Integer.parseInt(tabnum[i]));
				session.delete(unClient);
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
