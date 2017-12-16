DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS months;
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

CREATE TABLE months(
  id SERIAL4 PRIMARY KEY,
  month_name VARCHAR(255),
  tag_budget BOOLEAN,
  tag_id INT4 REFERENCES tags(id),
  monthly_limit INT4
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  vendor_id INT4 REFERENCES vendors(id),
  tag_id INT4 REFERENCES tags(id),
  value INT2,
  transaction_date DATE,
  comment VARCHAR(255),
  month_id INT4 REFERENCES months(id)
);
