package com.epul.permispiste.bean;

import java.io.Serializable;

public class ScoreBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idAction;
	private int score;

	public ScoreBean() {
	}

	public ScoreBean(int idAction, int score) {
		super();
		this.idAction = idAction;
		this.score = score;
	}

	public int getIdAction() {
		return idAction;
	}

	public void setIdAction(int idAction) {
		this.idAction = idAction;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

}
