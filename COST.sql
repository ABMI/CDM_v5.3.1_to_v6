-- Insert data from Device_exposure
select 
	cost_id,
	b.person_id,
	cost_event_id,
	case when cost_domain_id='device' then device_concept_id 
		end as cost_event_field_concept_id,
	NULL as cost_concept_id,			
	cost_type_concept_id,
	NULL as cost_source_concept_id,			
	NULL as cost_source_value,
	currency_concept_id,
	total_cost as cost,
	case when cost_domain_id='device' then device_exposure_start_date 
		 end as incurred_date,
	NULL as billed_date,
	NULL as paid_date,
	revenue_code_concept_id,
	drg_concept_id,
	a.payer_plan_period_id

into @DatabaseSchemaCDMVersion6.dbo.cost
from @DatabaseSchemaCDMVersion5.COST a, @DatabaseSchemaCDMVersion5.PAYER_PLAN_PERIOD b, @DatabaseSchemaCDMVersion5.DEVICE_EXPOSURE c
where a.payer_plan_period_id=b.payer_plan_period_id
	and b.person_id=c.person_id
	and a.cost_id=c.device_exposure_id
	and cost_domain_id='device'

--Insert data from Drug_exposure
Insert into @DatabaseSchemaCDMVersion6.dbo.cost
select 
	cost_id,
	b.person_id,
	cost_event_id,
	case when cost_domain_id='drug' then drug_concept_id 
		end as cost_event_field_concept_id,
	NULL as cost_concept_id,			
	cost_type_concept_id,
	NULL as cost_source_concept_id,			
	NULL as cost_source_value,
	currency_concept_id,
	total_cost as cost,
	case when cost_domain_id='drug' then drug_exposure_start_date 
		 end as incurred_date,
	NULL as billed_date,
	NULL as paid_date,
	revenue_code_concept_id,
	drg_concept_id,
	a.payer_plan_period_id

from @DatabaseSchemaCDMVersion5.COST a, @DatabaseSchemaCDMVersion5.PAYER_PLAN_PERIOD b, @DatabaseSchemaCDMVersion5.DRUG_EXPOSURE c
where a.payer_plan_period_id=b.payer_plan_period_id
	and b.person_id=c.person_id
	and a.cost_id=c.drug_exposure_id
	and cost_domain_id='drug'

--Insert data from Procedure_occurrence
Insert into @DatabaseSchemaCDMVersion6.dbo.cost
select 
	cost_id,
	b.person_id,
	cost_event_id,
	case when cost_domain_id='procedure' then procedure_concept_id
		end as cost_event_field_concept_id,
	NULL as cost_concept_id,
	cost_type_concept_id,
	NULL as cost_source_concept_id,			
	NULL as cost_source_value,
	currency_concept_id,
	total_cost as cost,
	case when cost_domain_id='procedure' then procedure_date
		 end as incurred_date,
	NULL as billed_date,
	NULL as paid_date,
	revenue_code_concept_id,
	drg_concept_id,
	a.payer_plan_period_id

from @DatabaseSchemaCDMVersion5.COST a, @DatabaseSchemaCDMVersion5.PAYER_PLAN_PERIOD b, @DatabaseSchemaCDMVersion5.PROCEDURE_OCCURRENCE c
where a.payer_plan_period_id=b.payer_plan_period_id
	and b.person_id=c.person_id
	and a.cost_id=c.procedure_occurrence_id
	and cost_domain_id='procedure'

--Insert data from Visit_occurrence
Insert into @DatabaseSchemaCDMVersion6.cost
select 
	cost_id,
	b.person_id,
	cost_event_id,
	case when cost_domain_id='visit' then visit_concept_id 
		end as cost_event_field_concept_id,	
	NULL as cost_concept_id,			
	cost_type_concept_id,
	NULL as cost_source_concept_id,			
	NULL as cost_source_value,
	currency_concept_id,
	total_cost as cost,
	case when cost_domain_id='visit' then visit_start_date
		 end as incurred_date,
	NULL as billed_date,
	NULL as paid_date,
	revenue_code_concept_id,
	drg_concept_id,
	a.payer_plan_period_id

from @DatabaseSchemaCDMVersion5.COST a, @DatabaseSchemaCDMVersion5.PAYER_PLAN_PERIOD b, @DatabaseSchemaCDMVersion5.VISIT_OCCURRENCE c
where a.payer_plan_period_id=b.payer_plan_period_id
	and b.person_id=c.person_id
	and a.cost_id=c.visit_occurrence_id
	and cost_domain_id='visit'
