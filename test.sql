.header on

select 'Hello Youtube!';

CREATE TABLE if not exists episode (
	EpisodeID INTEGER PRIMARY KEY,
	EpisodeName TEXT,
	Description TEXT
	Creation	TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Episode(EpisodeID, EpisodeName, Description) 
	         VALUES('0', 	   'Tech Demo', 'Just showing off the technology.');

SELECT * from episode order by episodeid desc limit 1;	         