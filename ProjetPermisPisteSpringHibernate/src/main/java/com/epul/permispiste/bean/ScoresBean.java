package com.epul.permispiste.bean;

import java.io.Serializable;
import java.util.List;

public class ScoresBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<ScoreBean> scores;

	public ScoresBean(List<ScoreBean> scores) {
		super();
		this.scores = scores;
	}

	public List<ScoreBean> getScores() {
		return scores;
	}

	public void setScores(List<ScoreBean> scores) {
		this.scores = scores;
	}

}
