package com.epul.permispiste.metier;

// Generated 25 juin 2015 09:52:23 by Hibernate Tools 4.3.1

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * Obtient generated by hbm2java
 */
@Entity
@Table(name = "obtient", catalog = "permispiste")
public class Obtient implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ObtientId id;
	@JsonBackReference("obtient")
	private Action action;
	private Apprenant apprenant;
	private Calendrier calendrier;
	private Integer valeurdebut;
	private Integer valeurfin;

	public Obtient() {
	}

	public Obtient(ObtientId id, Action action, Apprenant apprenant,
			Calendrier calendrier) {
		this.id = id;
		this.action = action;
		this.apprenant = apprenant;
		this.calendrier = calendrier;
	}

	public Obtient(ObtientId id, Action action, Apprenant apprenant,
			Calendrier calendrier, Integer valeurdebut, Integer valeurfin) {
		this.id = id;
		this.action = action;
		this.apprenant = apprenant;
		this.calendrier = calendrier;
		this.valeurdebut = valeurdebut;
		this.valeurfin = valeurfin;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "numapprenant", column = @Column(name = "NUMAPPRENANT", nullable = false)),
			@AttributeOverride(name = "datejour", column = @Column(name = "DATEJOUR", nullable = false, length = 10)),
			@AttributeOverride(name = "numaction", column = @Column(name = "NUMACTION", nullable = false)) })
	public ObtientId getId() {
		return this.id;
	}

	public void setId(ObtientId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NUMACTION", nullable = false, insertable = false, updatable = false)
	@JsonBackReference("obtient")
	public Action getAction() {
		return this.action;
	}

	public void setAction(Action action) {
		this.action = action;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NUMAPPRENANT", nullable = false, insertable = false, updatable = false)
	@JsonBackReference
	public Apprenant getApprenant() {
		return this.apprenant;
	}

	public void setApprenant(Apprenant apprenant) {
		this.apprenant = apprenant;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DATEJOUR", nullable = false, insertable = false, updatable = false)
	public Calendrier getCalendrier() {
		return this.calendrier;
	}

	public void setCalendrier(Calendrier calendrier) {
		this.calendrier = calendrier;
	}

	@Column(name = "VALEURDEBUT")
	public Integer getValeurdebut() {
		return this.valeurdebut;
	}

	public void setValeurdebut(Integer valeurdebut) {
		this.valeurdebut = valeurdebut;
	}

	@Column(name = "VALEURFIN")
	public Integer getValeurfin() {
		return this.valeurfin;
	}

	public void setValeurfin(Integer valeurfin) {
		this.valeurfin = valeurfin;
	}

}
