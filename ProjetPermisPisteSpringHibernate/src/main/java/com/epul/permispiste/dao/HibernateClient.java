package com.epul.permispiste.dao;

import java.util.ArrayList;
import java.util.List;

import metier.Action;
import metier.Apprenant;
import metier.Jeu;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.epul.permispiste.gestiondeserreurs.MonException;
import com.epul.permispiste.gestiondeserreurs.ServiceHibernateException;
import com.epul.permispiste.service.ServiceHibernate;

public class HibernateClient {

	private Session session;

	// On rï¿½cupï¿½re toutes les lignes de la table dans une liste
	/*
	 * (non-Javadoc)
	 * 
	 * @see hibernate.service.InterfaceHibrnateStage#getTouteslesLignes()
	 */

	public List<Jeu> getTouslesJeux() throws HibernateException,
			ServiceHibernateException {
		List<Jeu> mesJeux = null;
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session.createQuery("SELECT j  FROM Jeu AS j");
			mesJeux = query.list();
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return mesJeux;
	}

	public List<Action> getToutesLesActions() throws HibernateException,
			ServiceHibernateException {
		List<Action> mesActions = new ArrayList<Action>();
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session.createQuery("SELECT j  FROM Action AS j");
			mesActions = query.list();
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return mesActions;
	}

	public Action getUneAction(int numAction) throws HibernateException,
			ServiceHibernateException {
		Action action = null;
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session
					.createQuery("SELECT j  FROM Action AS j where j.numaction = "
							+ numAction);
			List<Action> actions = query.list();
			if (actions != null && actions.size() > 0) {
				action = actions.get(0);
			}
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return action;
	}

	// On rï¿½cupï¿½re une ligne avec une clï¿½
	// TODO : modifier pour éviter d'appeler tous les jeux (voir getUneAction)
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * hibernate.service.InterfaceHibrnateStage#getUneLigne(java.lang.String)
	 */

	public Jeu getUnJeu(int num) throws ServiceHibernateException, Exception {
		boolean trouve = false;
		Jeu unJeu = null;
		try {
			List<Jeu> mesJeux = getTouslesJeux();
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
	
	
	public Apprenant getUnApprenant(int id) throws HibernateException,
	ServiceHibernateException {
		Apprenant a = null;
		try {
			session = ServiceHibernate.currentSession();
			Query query = session
					.createQuery("SELECT j  FROM Apprenant AS j where j.numapprenant = "
							+ id);
			List<Apprenant> apprenants = query.list();
			if (apprenants != null && apprenants.size() > 0) {
				a = apprenants.get(0);
			}
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return a;
	}
	
	public void sauverApprenant(Apprenant apprenant) throws ServiceHibernateException, Exception {
		try {
				session = ServiceHibernate.currentSession();
				session.beginTransaction();
				session.saveOrUpdate(apprenant);
				session.getTransaction().commit();
		} catch (ServiceHibernateException ex) {
			throw new ServiceHibernateException("Erreur de service Hibernate: "
					+ ex.getMessage(), ex);
		} catch (Exception ex) {
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
	}

}
