package com.epul.permispiste.bean;

import java.util.List;

import com.epul.permispiste.metier.Apprenant;

public class ActionsBean {

	private String nom;
	private String prenom;
	private List<ActionBean> actions;

	public ActionsBean(String nom, String prenom, List<ActionBean> actions) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.actions = actions;
	}

	public ActionsBean(Apprenant a, List<ActionBean> actions) {
		super();
		this.nom = a.getNomapprenant();
		this.prenom = a.getPrenomapprenant();
		this.actions = actions;
	}

	public List<ActionBean> getActions() {
		return actions;
	}

	public void setActions(List<ActionBean> actions) {
		this.actions = actions;
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
