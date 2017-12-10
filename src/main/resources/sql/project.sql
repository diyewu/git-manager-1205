select id,pac.attribute_id as parent_id,pac.leaf,pac.id as is_ckeck from project_attribute_condition pac 
union 
select id,pa.project_id as parent_id ,0 as leaf,pa.id as is_ckeck from project_attribute pa 
union 
select id,null as parent_id,0 as leaf ,pm.id as is_check from project_main pm ORDER BY parent_id desc;


select a.*
from
(
SELECT
	id,
	pac.attribute_condition AS menu_name,
	pac.attribute_id AS parent_id,
	pac.leaf,
	pac.id AS is_check
FROM
	project_attribute_condition pac
UNION
	SELECT
		id,
		pa.attribute_name AS menu_name,
		pa.project_id AS parent_id,
		0 AS leaf,
		pa.id AS is_check
	FROM
		project_attribute pa
	WHERE
		pa.attribute_active = 1
	UNION
		SELECT
			id,
			pm.project_name AS menu_name,
			NULL AS parent_id,
			0 AS leaf,
			pm.id AS is_check
		FROM
			project_main pm
		
)a INNER JOIN project_condition_auth pca on a.id = pca.condition_id 

ORDER BY
			a.id DESC;