CREATE TABLE IF NOT EXISTS llm_data_upstream (
    first_name TEXT,
	last_name TEXT,
	title TEXT,
	email TEXT,
	work_history JSONB[],
	company TEXT NOT NULL,
	employee_size BIGINT,
	industry TEXT,
	company_state TEXT,
	company_country TEXT,
	keywords TEXT[],
	seo_discription TEXT,
	technologies TEXT[],
	total_funding BIGINT,
	latest_funding TEXT,
	latest_funding_amount BIGINT,
	short_description TEXT,
	founded_year BIGINT
)

Insert INTO llm_data_upstream
SELECT sf.first_name,
		sf.last_name,
		sf.title,
		sf.email,
		sf.work_history,
		cs.company,
		cs.employees as employee_size,
		cs.industry,
		cs.company_state,
		cs.company_country,
		cs.keywords,
		cs.seo_discription,
		cs.technologies,
		cs.total_funding,
		cs.latest_funding,
		cs.latest_funding_amount,
		cs.short_description,
		cs.founded_year
FROM solar_contacts_without_salesforce_founder sf
JOIN solar_companies_without_salesforce cs ON sf.company_linkedin = cs.company_linkedin_url
WHERE sf.email_status = 'verified'