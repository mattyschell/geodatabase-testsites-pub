select 
	count(*)
from 
	sys.tables as tab
inner join 
	sys.columns as col
on 
	tab.object_id = col.object_id
where 
	tab.name = 'oti_covidtestingsites'
and schema_name(tab.schema_id) = current_user
and col.name in ('OBJECTID'
                ,'flag'
				,'unique_id'
				,'id'
				,'site_name'
				,'state'
				,'county'
				,'address'
				,'city'
				,'zip_code'
				,'phone_number'
				,'testing_status'
				,'appointment_required'
				,'physician_order_required'
				,'screening_required'
				,'restrictions_apply'
				,'restriction_details'
				,'type_of_center'
				,'rapid_testing'
				,'non_rapid_testing'
                ,'guidelines'
                ,'provider_url'
	            ,'antibody_testing'
	            ,'monday'
	            ,'tuesday'
	            ,'wednesday'
	            ,'thursday'
	            ,'friday'
	            ,'saturday'
	            ,'sunday'
	            ,'latitude'
	            ,'longitude'
	            ,'cost_of_test'
	            ,'open_date'
	            ,'close_date'
	            ,'minimum_age')





