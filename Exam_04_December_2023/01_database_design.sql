DROP TABLE IF EXISTS countries CASCADE;
CREATE TABLE countries (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender CHAR(1) CHECK (gender IN ('M', 'F')),
	age INT NOT NULL CHECK (age > 0),
	phone_number CHAR(10) NOT NULL,
	country_id INT NOT NULL,
	CONSTRAINT fk_distributors_countries FOREIGN KEY(country_id) REFERENCES countries(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(25) NOT NULL,
	description VARCHAR(250),
	recipe TEXT,
	price NUMERIC(10,2) NOT NULL CHECK (price>0)
);

DROP TABLE IF EXISTS feedbacks CASCADE;
CREATE TABLE feedbacks (
	id SERIAL PRIMARY KEY,
	description VARCHAR(255),
	rate NUMERIC(4,2) CHECK(rate BETWEEN 0 AND 10),
	product_id INT NOT NULL,
	CONSTRAINT fk_feedbacks_products FOREIGN KEY(product_id) REFERENCES products(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	customer_id INT NOT NULL,
	CONSTRAINT fk_feedbacks_customers FOREIGN KEY(customer_id) REFERENCES customers(id)
		ON DELETE CASCADE ON UPDATE CASCADE	
);

DROP TABLE IF EXISTS distributors CASCADE;
CREATE TABLE distributors (
	id SERIAL PRIMARY KEY,
	name VARCHAR(25) UNIQUE NOT NULL,
	address VARCHAR(30) NOT NULL,
	summary VARCHAR(200) NOT NULL,
	country_id INT NOT NULL,
	CONSTRAINT fk_distributors_countries FOREIGN KEY(country_id) REFERENCES countries(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS ingredients CASCADE;
CREATE TABLE ingredients (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	description VARCHAR(200),
	country_id INT NOT NULL,
	CONSTRAINT fk_ingredients_countries FOREIGN KEY(country_id) REFERENCES countries(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	distributor_id INT NOT NULL,
	CONSTRAINT fk_ingredients_distributors FOREIGN KEY(distributor_id) REFERENCES distributors(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS products_ingredients CASCADE;
CREATE TABLE products_ingredients (
	product_id INT,
	CONSTRAINT fk_products_ingredients_products FOREIGN KEY(product_id) REFERENCES products(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	ingredient_id INT,
	CONSTRAINT fk_products_ingredients_ingredients FOREIGN KEY(ingredient_id) REFERENCES ingredients(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT pk_products_ingredients PRIMARY KEY(product_id, ingredient_id)
);
