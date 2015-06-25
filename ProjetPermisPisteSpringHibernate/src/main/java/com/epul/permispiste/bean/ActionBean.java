package com.epul.permispiste.bean;

import java.io.Serializable;

import com.epul.permispiste.metier.Action;

public class ActionBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int numaction;
	private String libaction;
	private Integer scoremin;

	public ActionBean(int numaction, String libaction, Integer scoremin) {
		super();
		this.numaction = numaction;
		this.libaction = libaction;
		this.scoremin = scoremin;
	}

	public ActionBean(Action a) {
		super();
		this.numaction = a.getNumaction();
		this.libaction = a.getLibaction();
		this.scoremin = a.getScoremin();
	}

	public int getNumaction() {
		return numaction;
	}

	public void setNumaction(int numaction) {
		this.numaction = numaction;
	}

	public String getLibaction() {
		return libaction;
	}

	public void setLibaction(String libaction) {
		this.libaction = libaction;
	}

	public Integer getScoremin() {
		return scoremin;
	}

	public void setScoremin(Integer scoremin) {
		this.scoremin = scoremin;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
