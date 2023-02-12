package com.demo;

public class Product
{
	
	private String bt;
	private String nr;
	private String sj;

	public Product()
	{
	}

	public Product(String bt, String nr, String sj)
	{
		super();
		this.bt = bt;
		this.nr = nr;
		this.sj = sj;
		
	}

	public String getbt()
	{
		return bt;
	}

	public void setbt(String bt)
	{
		this.bt= bt;
	}

	public String getnr()
	{
		return nr;
	}

	public void setnr(String nr)
	{
		this.nr = nr;
	}

	public String getsj()
	{
		return sj;
	}
	public void setsj(String sj)
	{
		this.sj = sj;
	}

	
}
