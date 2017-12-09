select id,pac.attribute_id as parent_id,pac.leaf,pac.id as is_ckeck from project_attribute_condition pac 
union 
select id,pa.project_id as parent_id ,0 as leaf,pa.id as is_ckeck from project_attribute pa 
union 
select id,null as parent_id,0 as leaf ,pm.id as is_check from project_main pm ORDER BY parent_id desc