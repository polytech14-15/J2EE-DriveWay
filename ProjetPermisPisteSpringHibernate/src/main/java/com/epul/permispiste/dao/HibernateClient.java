package com.epul.permispiste.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.epul.permispiste.gestiondeserreurs.MonException;
import com.epul.permispiste.gestiondeserreurs.ServiceHibernateException;
import com.epul.permispiste.metier.Action;
import com.epul.permispiste.metier.Apprenant;
import com.epul.permispiste.metier.Calendrier;
import com.epul.permispiste.metier.Indicateur;
import com.epul.permispiste.metier.Jeu;
import com.epul.permispiste.metier.Mission;
import com.epul.permispiste.metier.Objectif;
import com.epul.permispiste.metier.Regle;
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

	public List<Apprenant> getTouslesApprenant() throws HibernateException,
			ServiceHibernateException {
		List<Apprenant> mesApprenants = null;
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session.createQuery("SELECT j  FROM Apprenant AS j");
			mesApprenants = query.list();
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return mesApprenants;
	}

	public Apprenant getUnApprenant(int numApprenant)
			throws HibernateException, ServiceHibernateException {
		Apprenant apprenant = null;
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session
					.createQuery("SELECT j  FROM Apprenant AS j where j.numapprenant = "
							+ numApprenant);
			List<Apprenant> apprenants = query.list();
			if (apprenants != null && apprenants.size() > 0) {
				apprenant = apprenants.get(0);
			}
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return apprenant;
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

	public List<Calendrier> getTousLesCalendriers() throws HibernateException,
			ServiceHibernateException {
		List<Calendrier> mesCalendriers = new ArrayList<Calendrier>();
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session.createQuery("SELECT j  FROM calendrier AS j");
			mesCalendriers = query.list();
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return mesCalendriers;
	}

	public List<Indicateur> getTousLesIndicateurs() throws HibernateException,
			ServiceHibernateException {
		List<Indicateur> mesIndicateurs = new ArrayList<Indicateur>();
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session.createQuery("SELECT j  FROM indicateur AS j");
			mesIndicateurs = query.list();
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return mesIndicateurs;
	}

	public List<Mission> getToutesLesMissions() throws HibernateException,
			ServiceHibernateException {
		List<Mission> mesMissions = new ArrayList<Mission>();
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session.createQuery("SELECT j  FROM mission AS j");
			mesMissions = query.list();
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return mesMissions;
	}

	public List<Objectif> getTousLesObjectifs() throws HibernateException,
			ServiceHibernateException {
		List<Objectif> mesObjectifs = new ArrayList<Objectif>();
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session.createQuery("SELECT j  FROM objectif AS j");
			mesObjectifs = query.list();
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return mesObjectifs;
	}

	public List<Regle> getToutesLesRegles() throws HibernateException,
			ServiceHibernateException {
		List<Regle> mesRegles = new ArrayList<Regle>();
		try {
			session = ServiceHibernate.currentSession();
			// On passe une requï¿½te de type SQL mlais on travaille sur la
			// classe
			Query query = session.createQuery("SELECT j  FROM regle AS j");
			mesRegles = query.list();
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
		return mesRegles;
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

	public void sauverApprenant(Apprenant apprenant)
			throws ServiceHibernateException, Exception {
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
	
	public void supprimerApprenant(int numApprenant) throws HibernateException, ServiceHibernateException {
		try {
			session = ServiceHibernate.currentSession();
//			Query query = session.createQuery("DELETE FROM Apprenant where numapprenant = "+ numApprenant);
//			int delete = query.executeUpdate();
			Apprenant a = (Apprenant) session.get(Apprenant.class, numApprenant);
			System.out.println(numApprenant);
			System.out.println(a.getNomapprenant());
			session.delete(a);
		} catch (Exception ex) {
			System.out.println("Erreur ServiceHiber : " + ex.getMessage());
			throw new MonException("Erreur  Hibernate: ", ex.getMessage());
		}
	}

}
