DROP VIEW IF EXISTS pulse.patient_discovery_query_stats;
CREATE OR REPLACE VIEW pulse.patient_discovery_query_stats AS
SELECT 
	loc.id as location_id,
	loc.name as location_name,
	locStatus.name as location_status_name,
	loc.location_type as location_type,
	status.status,
	queryLocationMap.start_date,
	queryLocationMap.end_date
FROM pulse.query_location_map queryLocationMap
LEFT OUTER JOIN pulse.location loc on 
	queryLocationMap.location_id = loc.id
LEFT OUTER JOIN pulse.location_status locStatus on
	loc.location_status_id = locStatus.id
LEFT OUTER JOIN pulse.query_location_status status on 
	(queryLocationMap.query_location_status_id IS NOT NULL 
	AND queryLocationMap.query_location_status_id = status.id);