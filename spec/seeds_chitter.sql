 -- replace with your own table name.
TRUNCATE TABLE users, peeps RESTART IDENTITY;
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, user_name) VALUES('tomfyfe85@wwemail.com', 'batdad', 'tom', 'THEEBATDAD');
INSERT INTO users (email, password, name, user_name) VALUES('someguy@wwemail.com', 'password1', 'john', 'BIGJOHN');

INSERT INTO peeps (peep, time, user_id) VALUES ('hi mum!', '13:01', 1);
INSERT INTO peeps (peep, time, user_id) VALUES ('this is a peep', '13:05', 2);