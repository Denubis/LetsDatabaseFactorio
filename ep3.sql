select 'Salvite sodales and Hello Youtube!';

REPLACE INTO Episode(EpisodeID, EpisodeName, Description) 
	         VALUES('3', 	   'Basic Base Mining', 'Starting on electric mining.');

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

REPLACE INTO todolist ( ListID, 	EpisodeID, 	Title,			
						todoDescription)
				VALUES(	3, 			3,			'Basic Mining', 		
						'Get local iron and copper mines to mostly electric.');	

REPLACE INTO todolist ( ListID, 	EpisodeID, 	Title,			
						todoDescription)
				VALUES(	4, 			3,			'Basic Science', 		
						'Get science started.');	
REPLACE INTO todoliststate (ListID) VALUES(3), 
										  (4);

select 'Valete sodales';