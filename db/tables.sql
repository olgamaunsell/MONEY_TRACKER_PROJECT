DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS budgets;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS vendors;

CREATE TABLE vendors(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE budgets(
  id SERIAL4 PRIMARY KEY,
  month_no INT2,
  year INT2,
  name VARCHAR(255),
  tag_id INT4 REFERENCES tags(id),
  monthly_limit DECIMAL
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  vendor_id INT4 REFERENCES vendors(id),
  tag_id INT4 REFERENCES tags(id),
  amount DECIMAL,
  transaction_date DATE,
  comment VARCHAR(255)
);
