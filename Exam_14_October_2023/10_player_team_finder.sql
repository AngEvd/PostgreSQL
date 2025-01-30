CREATE OR REPLACE PROCEDURE sp_players_team_name(player_name VARCHAR(50), OUT "Output" VARCHAR(45))
AS
$$
	BEGIN
		SELECT
			COALESCE(t.name, 'The player currently has no team')
		INTO
			"Output"
		FROM
			players AS p
		LEFT JOIN
			teams AS t
		ON
			p.team_id = t.id
		WHERE
			CONCAT(p.first_name, ' ', p.last_name) = player_name;
	
	END;
$$

LANGUAGE plpgsql;