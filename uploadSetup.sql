/*CREATE TABLE if not exists episode (
	EpisodeID INTEGER PRIMARY KEY,
	EpisodeName TEXT,
	Description TEXT
	Creation	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	OriginalFilename TEXT,
	UploadDate TIMESTAMP,
	ScheduledDate TIMESTAMP
);
*/

select * from episode;


update episode set originalFilename = 'uploaded/Factorio DB 2017-01-18 12-36-28.mp4' where episodeid = 1;
update episode set originalFilename = 'uploaded/Factorio DB 2017-01-18 13-20-41.mp4' where episodeid = 2;
update episode set originalFilename = 'uploaded/Factorio DB 2017-01-18 13-52-59.mp4' where episodeid = 3;
update episode set originalFilename = 'uploaded/Factorio DB 2017-01-19 20-46-38.mp4' where episodeid = 4;
update episode set originalFilename = 'uploaded/Factorio DB 2017-01-19 21-16-44.mp4' where episodeid = 5;
update episode set originalFilename = 'uploaded/Factorio DB 2017-01-19 22-41-35.mp4' where episodeid = 6;
update episode set originalFilename = 'uploaded/Factorio DB 2017-01-21 22-15-23.mp4' where episodeid = 7;
update episode set originalFilename = 'uploaded/Factorio DB 2017-01-21 22-40-09.mp4' where episodeid = 8;


update episode set uploadDate = '2017-01-18' where episodeid IN (0,1,2,3);
update episode set uploadDate = '2017-01-20' where episodeid IN (4,5,6);
update episode set uploadDate = '2017-01-22' where episodeid IN (7,8);
update episode set uploadDate = '2017-01-25' where episodeid IN (9);
update episode set uploadDate = '2017-01-29' where episodeid IN (10, 21);

update episode set scheduledDate = datetime('2017-01-17 00:00:00', '+'||episodeid||' day');