SELECT 
    u.*,
    GROUP_CONCAT(hs.shelter_id) as managed_shelter_ids,
    GROUP_CONCAT(s.name) as managed_shelter_names
FROM 
    users u
LEFT JOIN 
    healthstaff_shelters hs ON u.id = hs.user_id
LEFT JOIN 
    shelters s ON hs.shelter_id = s.id
WHERE 
    u.role = 'HealthStaff'
GROUP BY 
    u.id;