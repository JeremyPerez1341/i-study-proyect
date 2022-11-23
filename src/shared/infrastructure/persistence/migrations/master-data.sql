INSERT INTO users(id, name, lastname, email, number) VALUES
('00100001', 'Julio', 'Ramirez', 'juliorz123@gmail.com', '985344571'),
('00100002', 'Darlin', 'Montenegro', 'montenegrodn111@gmail.com', '947775341'),
('00100003', 'Damian', 'Valto', 'damianvalto91@gmail.com', '991237648');

INSERT INTO cards(id, cardType, numberCard, cvv, expMonth, expYear, user_id) VALUES
('001000000001', 'VISA', '4110916512962123', '701', '01', '2022', '00100001'),
('001000000002', 'MASTERCARD', '5388523461152243', '464', '01', '2022', '00100002'),
('001000000003', 'DISCOVER', '6011192323771831', '913', '07', '2022', '00100002'),
('001000000004', 'AMERICAN EXPRESS', '370479888667340', '232', '01', '2022', '00100003');

INSERT INTO paypal(id, email, password, address, user_id) VALUES
('0010000001', 'julio12225@outlook.com', 'juliormrz321', 'Av. Lusmila, cuadra 7', '00100001'),
('0010000002', 'montedar222@outlook.com', 'darlinmtn', 'Av. Las Flores, 1994', '00100002'),
('0010000003', 'valto7299@outlook.com', 'dmnvalto775', 'Av. Villa Real, giron 2', '00100003');