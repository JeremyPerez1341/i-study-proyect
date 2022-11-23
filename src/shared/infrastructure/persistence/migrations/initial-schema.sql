CREATE TABLE IF NOT EXISTS users (
  id VARCHAR(8) NOT NULL,
  name VARCHAR(45) NOT NULL,
  lastname VARCHAR(45) NOT NULL,
  email VARCHAR(255) NOT NULL,
  number INT UNSIGNED NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY UQ_users_name_lastname_email_number(id, name, lastname,email, number)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS cards (
  id VARCHAR(12) NOT NULL,
  cardtype VARCHAR(25) NULL,
  numbercard VARCHAR(18) NULL,
  cvv VARCHAR(3) NULL,
  expMonth VARCHAR(2) NULL,
  expYear VARCHAR(4) NULL,
  user_id VARCHAR(8) NULL,
  PRIMARY KEY(id),
  UNIQUE KEY UQ_cards_id_cardType_numberCard_cvv_expMonth_expYear_user_id(id, cardType, numberCard, cvv, expMonth, expYear, user_id),
  KEY IX_cards_user_id(user_id),
  CONSTRAINT FK_cards_users_by FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS paypal (
  id VARCHAR(10) NOT NULL,
  email VARCHAR(45) NULL,
  password VARCHAR(45) NULL,
  address VARCHAR(125) NULL,
  user_id VARCHAR(15) NULL,
  PRIMARY KEY(id),
  UNIQUE KEY UQ_paypal_id_email_password_address_user_id(id, email, password, address, user_id),
  KEY IX_paypal_user_id(user_id),
  CONSTRAINT FK_paypal_users_by FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;