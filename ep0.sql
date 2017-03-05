select 'Salvite sodales and Hello Youtube!';


select sqlite_version();

drop table episode;

CREATE TABLE if not exists episode (
	EpisodeID INTEGER PRIMARY KEY,
	EpisodeName TEXT,
	Description TEXT
	Creation	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	OriginalFilename TEXT,
	UploadDate TIMESTAMP,
	ScheduledDate TIMESTAMP
);

INSERT INTO Episode(EpisodeID, EpisodeName, Description) 
	         VALUES('0', 	   'Series Introduction', 'Showing off the technology and mod list;.');

SELECT * from episode order by episodeid desc limit 1;	         

select 'Valete sodales';