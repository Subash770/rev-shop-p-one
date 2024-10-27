package com.revature.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 500)
	private String title;

	@Column(length = 5000)
	private String description;

	private String category;

	private Double price;

	private int stock;

	private String image;

	private int discount;

	private Double discountPrice;

	private Boolean isActive;

	@Column(length = 50) // Type for product: men, women, kids
	private String type;

	@Column(length = 100) // Sub-category for product: kurti, shirts, etc.
	private String subCategory;

	@Column(length = 20) // Size for product: S, M, L, XL or electronic sizes
	private String size;

	// Constructors
	public Product(Integer id) {
		this.id = id;
	}

	public Product() {
		super();
	}

	// Getters and Setters
	public Integer getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public String getCategory() {
		return category;
	}

	public Double getPrice() {
		return price;
	}

	public int getStock() {
		return stock;
	}

	public String getImage() {
		return image;
	}

	public int getDiscount() {
		return discount;
	}

	public Double getDiscountPrice() {
		return discountPrice;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public String getType() {
		return type;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public String getSize() {
		return size;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public void setDiscountPrice(Double discountPrice) {
		this.discountPrice = discountPrice;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public void setSize(String size) {
		this.size = size;
	}
}
