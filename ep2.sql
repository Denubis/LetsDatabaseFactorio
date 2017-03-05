select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
	         VALUES('2', 	   'Basic Yuoki Power', 'Starting on Yuoki power.');

SELECT EpisodeID, EpisodeName, Description from episode order by episodeid desc limit 1;	         

SELECT listID, title, EpisodeID, description
  from todolist 
  JOIN todoliststate USING (listid)
  JOIN todostate USING (stateID)
  JOIN episode USING (EpisodeID)
  WHERE stateID = 0
    AND listID not in (SELECT listid 
    	                 from todolist 
    	                 join todoliststate using (listid) 
    	                where stateID IN (1,2))
  order by listID desc;


drop table if exists todolist;
drop table if exists todostate;
drop table if exists todoliststate;

CREATE TABLE todostate (
	stateID INTEGER PRIMARY KEY,
	stateDescription TEXT);

INSERT INTO todostate (stateID, stateDescription) VALUES(0, 'Todo');
INSERT INTO todostate (stateID, stateDescription) VALUES(1, 'Done');
INSERT INTO todostate (stateID, stateDescription) VALUES(2, 'Abandoned');

CREATE TABLE todolist (
	ListID INTEGER PRIMARY KEY,
	EpisodeID INTEGER REFERENCES Episode (EpisodeID),
	Title	TEXT,
	todoDescription	 text,
	

	ParentListID INSERTGER REFERENCES todolist (listid)
);

CREATE TABLE todoliststate ( 
	ListID INTEGER REFERENCES todolist, 
	StateID INTEGER REFERENCES todostate DEFAULT 0,
	StateDate timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (ListID, StateID)
);


REPLACE INTO todolist ( ListID, 	EpisodeID, 	Title,			
						todoDescription)
				VALUES(	1, 			1,			'Goal', 		
						'Launch a rocket into space with recycled fuel.');

REPLACE INTO todolist ( ListID, 	EpisodeID, 	Title,			
						todoDescription)			
				VALUES( 2,			2, 			'Basic Power', 	
						'Get basic yuoki power going with a heavy pump and small electric motor.');

REPLACE INTO todoliststate (ListID) VALUES(1);
REPLACE INTO todoliststate (ListID) VALUES(2);
REPLACE INTO todoliststate (listID, stateID) VALUES(2,1);



select 'Valete sodales';