package com.epul.permispiste.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ScoresBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<ScoreBean> scores;
	private int idApprenant;
	private Date date;

	public ScoresBean() {
	}

	public ScoresBean(List<ScoreBean> scores, int idApprenant, Date date) {
		super();
		this.scores = scores;
		this.idApprenant = idApprenant;
		this.date = date;
	}

	public List<ScoreBean> getScores() {
		return scores;
	}

	public void setScores(List<ScoreBean> scores) {
		this.scores = scores;
	}

	public int getIdApprenant() {
		return idApprenant;
	}

	public void setIdApprenant(int idApprenant) {
		this.idApprenant = idApprenant;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
