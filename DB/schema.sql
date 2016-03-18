CREATE TABLE users (
  user_id SERIAL,
  name varchar(60),
  email varchar(30),
  gitub varchar(30),
  blackout date,
  PRIMARY KEY (user_id)
);

CREATE TABLE interviews (
  interview_id SERIAL,
  user_id INTEGER,
  interviewer_id INTEGER,
  decision_id INTEGER,
  technical_grade INTEGER,
  personal_grade  INTEGER,
  maker_prep  INTEGER,
  notes varchar(400),
  PRIMARY KEY (interview_id)
);

CREATE TABLE decision(
  decision_id SERIAL,
  description varchar(50),
  PRIMARY KEY (decision_id)
);

CREATE TABLE grades(
  grade_id SERIAL,
  description varchar(10),
  PRIMARY KEY (grade_id)
);

CREATE TABLE maker_prep (
  maker_prep_id SERIAL,
  description varchar(10),
  PRIMARY KEY (maker_prep_id)
);

CREATE TABLE interviewer(
  interviewer_id SERIAL,
  full_name varchar(70),
  PRIMARY KEY (interviewer_id)
);

ALTER TABLE interviews ADD FOREIGN KEY (decision_id) REFERENCES decision (decision_id);
ALTER TABLE interviews ADD FOREIGN KEY (technical_grade) REFERENCES grades (grade_id);
ALTER TABLE interviews ADD FOREIGN KEY (personal_grade) REFERENCES grades (grade_id);
ALTER TABLE interviews ADD FOREIGN KEY (maker_prep) REFERENCES maker_prep (maker_prep_id);
ALTER TABLE interviews ADD FOREIGN KEY (interviewer_id) REFERENCES interviewer (interviewer_id);
ALTER TABLE interviews ADD FOREIGN KEY (user_id) REFERENCES users(user_id);


INSERT INTO decision (description) VALUES ('soft reject');
