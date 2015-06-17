package com.epul.cerisaie.dao;

import com.epul.cerisaie.hibernate.metier.Apprenant;
import com.epul.cerisaie.hibernate.metier.Jeu;
import com.epul.cerisaie.hibernate.metier.Mission;
import org.hibernate.*;

import com.epul.cerisaie.service.ServiceHibernate;
import com.epul.cerisaie.gestiondeserreurs.MonException;
import com.epul.cerisaie.gestiondeserreurs.ServiceHibernateException;

import java.util.*;

public class HibernateClient {


    private List<Apprenant> mesApprenants = null;
    private List<Jeu> mesJeux = null;
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
            mesApprenants = (List<Apprenant>) query.list();
        } catch (Exception ex) {

            System.out.println("Erreur ServiceHiber : " + ex.getMessage());

            throw new MonException("Erreur  Hibernate: ", ex.getMessage());
        }
        return mesApprenants;
    }


    public Apprenant getUneLigne(int num) throws ServiceHibernateException, Exception {
        boolean trouve = false;
        Apprenant unApprenant = null;
        try {
            mesApprenants = getTouteslesLignes();
            int i = 0;
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
            //session.update(unApprenant.getObtients());
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


    public void effacer(Apprenant unApprenant) throws Exception,
            ServiceHibernateException {
        Transaction tx = null;
        try {
            // il faut fermer la session courante pour
            // lib�rer l'objet que l'on veut modifier
            ServiceHibernate.closeSession();
            session = ServiceHibernate.currentSession();
            tx = session.beginTransaction();

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

    public List<Jeu> getTouslesJeux() throws HibernateException,
            ServiceHibernateException {
        try {
            System.out.println("Get tous les Jeux :Je vais lire le fichier de conf ");
            session = ServiceHibernate.currentSession();
            // On passe une requ�te de type SQL mlais on travaille sur la classe
            Query query = session.createQuery("SELECT j  FROM Jeu AS j");
            mesJeux = (List<Jeu>) query.list();
        } catch (Exception ex) {

            System.out.println("Erreur ServiceHiber : " + ex.getMessage());

            throw new MonException("Erreur  Hibernate: ", ex.getMessage());
        }
        return mesJeux;
    }
    public Jeu getUneLigneJeu(int num) throws ServiceHibernateException, Exception {
        boolean trouve = false;
        Jeu unJeu = null;
        try {
            mesJeux = getTouslesJeux();
            int i = 0;
            while (i < mesJeux.size() && !trouve) {
                unJeu = mesJeux.get(i);
                if (unJeu.getNumjeu() == num)
                    trouve = true;
                i++;
            }
        } catch (ServiceHibernateException ex) {
            throw new ServiceHibernateException("Erreur de service Hibernate: "
                    + ex.getMessage(), ex);
        } catch (Exception ex) {
            throw new MonException("Erreur  Hibernate: ", ex.getMessage());
        }
        return unJeu;
    }

    public void inscrire(Jeu monJeu, Apprenant monApprenant) throws HibernateException,
            ServiceHibernateException {
        Transaction tx = null;
        monApprenant.getMonJeu().add(monJeu);
        try {
            session = ServiceHibernate.currentSession();
            tx = session.beginTransaction();
            // on transf�re l'apprenant � la base
            session.update(monApprenant);
            tx.commit();
        } catch (Exception ex) {

            System.out.println("Erreur ServiceHiber : " + ex.getMessage());

            throw new MonException("Erreur  Hibernate: ", ex.getMessage());
        }
    }
}
