package com.epul.permispiste.bean;

import java.util.List;

import com.epul.permispiste.metier.Apprenant;

public class RealisationsBean {

	private String nom;
	private String prenom;
	private List<RealisationBean> realisations;

	public RealisationsBean(String nom, String prenom,
			List<RealisationBean> realisations) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.realisations = realisations;
	}

	public RealisationsBean(Apprenant a, List<RealisationBean> realisations) {
		super();
		this.nom = a.getNomapprenant();
		this.prenom = a.getPrenomapprenant();
		this.realisations = realisations;
	}

	public List<RealisationBean> getActions() {
		return realisations;
	}

	public void setActions(List<RealisationBean> realisations) {
		this.realisations = realisations;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

}
