package com.epul.permispiste.bean;

import java.io.Serializable;
import java.util.Date;

import com.epul.permispiste.metier.Obtient;

public class RealisationBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int numaction;
	private String libaction;
	private Integer scoremin;
	private Date date;

	public RealisationBean(int numaction, String libaction, Integer scoremin,
			Date date) {
		super();
		this.numaction = numaction;
		this.libaction = libaction;
		this.scoremin = scoremin;
	}

	public RealisationBean(Obtient o) {
		super();
		this.numaction = o.getAction().getNumaction();
		this.libaction = o.getAction().getLibaction();
		this.scoremin = o.getValeurdebut();
		this.date = o.getCalendrier().getDatejour();
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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
