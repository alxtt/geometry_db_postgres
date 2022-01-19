-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** .`layer`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE layer (
  idlayer INT NOT NULL,
  updated TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (idlayer));
-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** .`entity`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE entity (
  identity INT NOT NULL,
  layer INT NOT NULL,
  PRIMARY KEY (identity),
  FOREIGN KEY (layer) REFERENCES layer(idlayer) ON DELETE CASCADE ON UPDATE CASCADE);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** .`point`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE point (
  idpoint INT NOT NULL,
  x DOUBLE PRECISION NOT NULL,
  y DOUBLE PRECISION NOT NULL,
  PRIMARY KEY (idpoint),
  FOREIGN KEY (idpoint) REFERENCES entity (identity) ON DELETE CASCADE ON UPDATE CASCADE);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** .`objtype`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE objtype (
  idobjtype SMALLINT NOT NULL,
  name VARCHAR(45) NOT NULL,
  freedegree INT NOT NULL,
  PRIMARY KEY (idobjtype));


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** .`object`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE object (
  idobject INT NOT NULL,
  objtype SMALLINT NOT NULL,
  PRIMARY KEY (idobject),
  FOREIGN KEY (objtype) REFERENCES objtype (idobjtype) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (idobject) REFERENCES entity (identity)  ON DELETE CASCADE ON UPDATE CASCADE);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** .`objspoints`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE objpoints (
  idpoint INT NOT NULL,
  idobject INT NOT NULL,
  num INT NULL,
  PRIMARY KEY (idpoint, idobject),
  FOREIGN KEY (idpoint) REFERENCES point (idpoint)   ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (idobject) REFERENCES object (idobject) ON DELETE CASCADE ON UPDATE CASCADE);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** .`constrtype`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE constrtype (
  idconstrtype SMALLINT NOT NULL,
  name VARCHAR(45) NULL,
  is_parametric SMALLINT NULL,
  PRIMARY KEY (idconstrtype));


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** .`constraint`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE constr (
  idconstraint INT NOT NULL,
  constrtype SMALLINT NOT NULL,
  parameter DOUBLE PRECISION NULL,  
  PRIMARY KEY (idconstraint),
  FOREIGN KEY (constrtype) REFERENCES constrtype (idconstrtype) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (idconstraint) REFERENCES entity (identity) ON DELETE CASCADE ON UPDATE CASCADE);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** .`constinfo`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE constrinfo (
  idconstraint INT NOT NULL,
  identity INT NOT NULL,
  PRIMARY KEY (idconstraint, identity),
  FOREIGN KEY (idconstraint) REFERENCES constr (idconstraint) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (identity) REFERENCES entity (identity) ON DELETE CASCADE ON UPDATE CASCADE);

