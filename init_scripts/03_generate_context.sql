CREATE DATABASE client_context;
\c client_context;

GRANT CONNECT ON DATABASE client_context TO readonly_user;
GRANT USAGE ON SCHEMA public TO readonly_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_user;

create table context (
	id serial PRIMARY KEY,
	client VARCHAR,
	table_name VARCHAR,
	column_name VARCHAR,
	data_type VARCHAR,
	last_updated timestamp,
	active BOOLEAN
);

create table calculated_fields(
	id serial PRIMARY KEY,
	client VARCHAR,
	table_name VARCHAR,
	field_type VARCHAR,
	field_name VARCHAR,
	formula VARCHAR,
	date_added timestamp DEFAULT CURRENT_TIMESTAMP
	);

CREATE TABLE client_week(
    id serial PRIMARY KEY,
    client VARCHAR,
    week_start VARCHAR,
    week_end VARCHAR
);


INSERT INTO client_week(
    client,
    week_start,
    week_end
) VALUES
      ('bank_client', 'Monday', 'Sunday'),
      ('insurance_client', 'Sunday', 'Saturday');


INSERT INTO context(
        client,
        table_name,
        column_name,
        data_type,
        last_updated,
        active
) VALUES
       ('bank_client', 'google_ads', 'Date', 'DATE', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'google_ads', 'Campaign', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'google_ads', 'Ad_Group', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'google_ads', 'Keyword', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'google_ads', 'Spend', 'DECIMAL(10, 2)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'google_ads', 'Impressions', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'google_ads', 'Clicks', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'google_ads', 'Conversions', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'google_ads', 'Revenue', 'DECIMAL(10, 2)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'client', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'date', 'DATE', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'campaign_release', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'research', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'creative', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'url', 'TEXT', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'publication', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'sector', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'citation', 'BOOLEAN', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'followed_link', 'BOOLEAN', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'pr_coverage_tracker', 'no_follow_link', 'BOOLEAN', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'google_ads_meta_blend', 'date', 'DATE', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'google_ads_meta_blend', 'campaign_group', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'google_ads_meta_blend', 'adset', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'google_ads_meta_blend', 'ad_budget', 'DECIMAL(10, 2)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'google_ads_meta_blend', 'impressions', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'google_ads_meta_blend', 'clicks', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'google_ads_meta_blend', 'orders', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'google_ads_meta_blend', 'gross_revenue', 'DECIMAL(10, 2)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'bing_ads', 'timeperiod', 'DATE', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'bing_ads', 'campaignid', 'BIGINT', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'bing_ads', 'campaignname', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'bing_ads', 'spend', 'DECIMAL(10, 2)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'bing_ads', 'clicks', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'bing_ads', 'impressions', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'bing_ads', 'conversions', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'bing_ads', 'revenue', 'DECIMAL(10, 2)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'bing_ads', 'date_added', 'TIMESTAMP WITH TIME ZONE', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'seo_ranking', 'profile', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'seo_ranking', 'date', 'DATE', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'seo_ranking', 'keyword', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'seo_ranking', 'website', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'seo_ranking', 'url', 'TEXT', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'seo_ranking', 'position', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('insurance_client', 'seo_ranking', 'average_monthly_searches', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
      ('bank_client', 'meta', 'platform', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'date', 'DATE', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'campaign', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'campaign_group', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'campaign_objective', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'adset', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'ad', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'ad_placement', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'ad_category', 'VARCHAR(255)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'ad_video_length', 'VARCHAR(50)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'impressions', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'clicks', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'spend', 'DECIMAL(10, 2)', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'landing_page_views', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'link_clicks', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'video_views_to_3_seconds', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'video_plays', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'video_views_to_25_percent', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'video_views_to_50_percent', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'video_views_to_75_percent', 'INTEGER', CURRENT_TIMESTAMP, TRUE),
    ('bank_client', 'meta', 'video_views_to_100_percent', 'INTEGER', CURRENT_TIMESTAMP, TRUE);



INSERT INTO calculated_fields(
	client,
	table_name,
	field_type,
	field_name,
	formula
	) VALUES
    ('bank_client','google_ads','metric', 'COS', 'sum(Spend) / sum(Revenue)'),
	('bank_client','google_ads','metric', 'CTR', 'sum(Clicks) / SUM(Impressions)'),
	('bank_client', 'meta', 'metric', 'Impressions/Landing Page Views', 'sum(impressions)/sum(landing_page_views)' ),
	('insurance_client', 'google_ads_meta_blend', 'metric', 'Click Through Rate', 'sum(clicks)/sum(impressions)'),
	('insurance_client', 'google_ads_meta_blend', 'metric', 'Return on Ad Spend', 'sum(gross_revenue)/sum(ad_budget)');




