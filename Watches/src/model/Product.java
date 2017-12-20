package model;

public class Product {
	private int id;
	private int id_cat;
	private Double price;
	private String name_cat;
	private String name;
	private String desctiption;
	public Product(int id, int id_cat, Double price, String name_cat, String name, String desctiption) {
		super();
		this.id = id;
		this.id_cat = id_cat;
		this.price = price;
		this.name_cat = name_cat;
		this.name = name;
		this.desctiption = desctiption;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesctiption() {
		return desctiption;
	}
	public void setDesctiption(String desctiption) {
		this.desctiption = desctiption;
	}
	public Product() {
		super();
	}
	public String getName_cat() {
		return name_cat;
	}
	public void setName_cat(String name_cat) {
		this.name_cat = name_cat;
	}
	
	
	// code sang
	public Long getProductID() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
