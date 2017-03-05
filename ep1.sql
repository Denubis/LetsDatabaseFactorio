select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
	         VALUES('1', 	   'Hello World', 'Getting the factory started and working on a SQL todo list.');

drop table if exists todolist;

CREATE TABLE todolist (
	ListID INTEGER PRIMARY KEY,
	EpisodeID INTEGER REFERENCES Episode (EpisodeID),
	Title	TEXT,
	Description	 text,
	ParentListID INTEGER REFERENCES todolist (listid)
);

REPLACE INTO todolist ( ListID, 	EpisodeID, 	Title,			Description)
				VALUES(	1, 			1,			'Goal', 		'Launch a rocket into space with recycled fuel.'),
					  ( 2,			1, 			'Basic Power', 	'Get basic yuoki power going with a heavy pump and small electric motor.'),
					  ( 3,			1, 			'Basic Mining', 'Get basic yuoki power going with a heavy pump and small electric motor.');

SELECT * from episode order by episodeid desc limit 1;	         

select 'Valete sodales';