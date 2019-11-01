package com.ihsinformatics.gpaconvertor.entities;

public class Lookup {
	private int lookupId;
	private String grade;
	private int startParcentage;
	private int endPercentage;
	private double gpa;

	public Lookup() {
	}

	public Lookup(int lookupId, String grade, int startParcentage, int endPercentage, double gpa) {
		super();
		this.lookupId = lookupId;
		this.grade = grade;
		this.startParcentage = startParcentage;
		this.endPercentage = endPercentage;
		this.gpa = gpa;
	}

	public int getLookupId() {
		return lookupId;
	}

	public void setLookupId(int lookupId) {
		this.lookupId = lookupId;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getStartParcentage() {
		return startParcentage;
	}

	public void setStartParcentage(int startParcentage) {
		this.startParcentage = startParcentage;
	}

	public int getEndPercentage() {
		return endPercentage;
	}

	public void setEndPercentage(int endPercentage) {
		this.endPercentage = endPercentage;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

}
