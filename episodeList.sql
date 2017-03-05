--select episodeid, uploaddate, scheduledDate from episode;
.mode line


select 'Let''s Database Factorio Episode ' || EpisodeID || ' - ' || EpisodeName as title, description || ' 

Modlist: https://gist.github.com/Denubis/3ada6 
Factorio is a game by Wube Software. Their description (factorio.com) states: "Factorio is a game in which you build and maintain factories. 
You will be mining resources, researching technologies, building infrastructure, automating production and fighting enemies. Use your imagination to design your factory, combine simple elements into ingenious structures, apply management skills to keep it working and finally protect it from the creatures who don''t really like you.

Come, join me in programming databases for optimal construction ratios and trying not to be completely overwhelmed by my chosen mods.

Join me on discord: https://discord.gg/ERQUGp6' as description,
'factorio, sql, let''s play' as tags, scheduledDate
from episode 
where episodeid > 21
order by episodeid ;


