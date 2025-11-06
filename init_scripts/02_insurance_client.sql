CREATE DATABASE insurance_client;
\c insurance_client;

GRANT CONNECT ON DATABASE insurance_client TO readonly_user;
GRANT USAGE ON SCHEMA public TO readonly_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_user;

CREATE TABLE google_ads_meta_blend (
    date DATE,
    campaign_group VARCHAR(255),
    adset VARCHAR(255),
    ad_budget DECIMAL(10, 2),
    impressions INTEGER,
    clicks INTEGER,
    orders INTEGER,
    gross_revenue DECIMAL(10, 2)
);


CREATE TABLE bing_ads (
    timeperiod DATE,
    campaignid BIGINT,
    campaignname VARCHAR(255),
    spend DECIMAL(10, 2),
    clicks INTEGER,
    impressions INTEGER,
    conversions INTEGER,
    revenue DECIMAL(10, 2),
    date_added TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE seo_ranking (
    profile VARCHAR(255),
    date DATE,
    keyword VARCHAR(255),
    website VARCHAR(255),
    url TEXT,
    position INTEGER,
    average_monthly_searches INTEGER
);

INSERT INTO google_ads_meta_blend (date, campaign_group, adset, ad_budget, impressions, clicks, orders, gross_revenue) VALUES
('2025-08-01', 'Car Insurance - Prospecting', 'UK - Drivers 25-45 - Interest Targeting', 500.00, 75000, 1500, 15, 4500.00),
('2025-08-01', 'Home Insurance - Brand', 'UK - Homeowners - Lookalike Audience', 400.00, 120000, 1200, 10, 2500.00),
('2025-08-02', 'Travel Insurance - Seasonal', 'Families - Summer Holiday Planners', 350.00, 90000, 1800, 45, 2250.00),
('2025-08-02', 'Pet Insurance - Acquisition', 'Dog & Cat Owners - 30+', 300.00, 65000, 1300, 25, 1000.00),
('2025-08-03', 'Car Insurance - Prospecting', 'London - Drivers 30-50 - Demographics', 550.00, 80000, 1600, 18, 5400.00),
('2025-08-03', 'Home Insurance - Brand', 'UK - Retargeting - Website Visitors 30d', 250.00, 50000, 1500, 12, 3000.00),
('2025-08-04', 'Travel Insurance - Seasonal', 'Europe Backpackers - 18-25', 400.00, 110000, 2200, 60, 3000.00),
('2025-08-04', 'Pet Insurance - Acquisition', 'Vets & Pet Food - Interest', 320.00, 70000, 1400, 28, 1120.00),
('2025-09-05', 'Car Insurance - Prospecting', 'UK - Drivers 25-45 - Interest Targeting', 510.00, 76000, 1550, 16, 4800.00),
('2025-09-05', 'Home Insurance - Brand', 'UK - Homeowners - Lookalike Audience', 410.00, 122000, 1250, 11, 2750.00),
('2025-09-06', 'Travel Insurance - Seasonal', 'Families - Summer Holiday Planners', 360.00, 92000, 1850, 48, 2400.00),
('2025-09-06', 'Pet Insurance - Acquisition', 'Dog & Cat Owners - 30+', 310.00, 67000, 1350, 26, 1040.00),
('2025-09-07', 'Car Insurance - Prospecting', 'London - Drivers 30-50 - Demographics', 560.00, 82000, 1650, 20, 6000.00),
('2025-09-07', 'Home Insurance - Brand', 'UK - Retargeting - Website Visitors 30d', 260.00, 52000, 1550, 14, 3500.00),
('2025-09-08', 'Travel Insurance - Seasonal', 'Europe Backpackers - 18-25', 415.00, 115000, 2300, 65, 3250.00),
('2025-09-08', 'Pet Insurance - Acquisition', 'Vets & Pet Food - Interest', 330.00, 72000, 1450, 30, 1200.00),
('2025-10-09', 'Car Insurance - Prospecting', 'UK - Young Drivers 17-24', 600.00, 95000, 2500, 22, 8800.00),
('2025-10-09', 'Home Insurance - Brand', 'High Net Worth - Postcodes', 450.00, 100000, 1000, 8, 3200.00),
('2025-10-10', 'Travel Insurance - Seasonal', 'Skiing & Snowboarding Interest', 450.00, 95000, 1900, 50, 4000.00),
('2025-10-10', 'Pet Insurance - Acquisition', 'Exotic Pet Owners - Niche', 250.00, 40000, 800, 15, 900.00),
('2025-10-11', 'Car Insurance - Prospecting', 'UK - Young Drivers 17-24', 610.00, 97000, 2550, 24, 9600.00),
('2025-10-11', 'Home Insurance - Brand', 'High Net Worth - Postcodes', 460.00, 102000, 1020, 9, 3600.00),
('2025-10-12', 'Travel Insurance - Seasonal', 'Skiing & Snowboarding Interest', 455.00, 96000, 1920, 52, 4160.00),
('2025-10-12', 'Pet Insurance - Acquisition', 'Exotic Pet Owners - Niche', 255.00, 41000, 820, 16, 960.00),
('2025-11-13', 'Car Insurance - Prospecting', 'UK - Drivers 25-45 - Interest Targeting', 520.00, 78000, 1580, 17, 5100.00),
('2025-11-13', 'Home Insurance - Brand', 'UK - Homeowners - Lookalike Audience', 420.00, 124000, 1280, 12, 3000.00),
('2025-11-14', 'Travel Insurance - Seasonal', 'Business Travellers - Frequent Flyers', 300.00, 70000, 1400, 30, 3000.00),
('2025-11-14', 'Pet Insurance - Acquisition', 'Dog & Cat Owners - 30+', 315.00, 68000, 1370, 27, 1080.00),
('2025-11-15', 'Car Insurance - Prospecting', 'London - Drivers 30-50 - Demographics', 570.00, 84000, 1680, 21, 6300.00),
('2025-11-15', 'Home Insurance - Brand', 'UK - Retargeting - Website Visitors 30d', 270.00, 54000, 1600, 15, 3750.00),
('2025-11-16', 'Travel Insurance - Seasonal', 'Business Travellers - Frequent Flyers', 305.00, 71000, 1420, 31, 3100.00),
('2025-11-16', 'Pet Insurance - Acquisition', 'Vets & Pet Food - Interest', 335.00, 73000, 1470, 31, 1240.00),
('2025-11-17', 'Gadget Insurance - Acquisition', 'Students - University Towns', 280.00, 90000, 2000, 50, 1500.00),
('2025-11-18', 'Motorbike Insurance - Prospecting', 'UK - Motorbike Owners - 30-60', 420.00, 60000, 1100, 12, 3600.00);

INSERT INTO bing_ads (timeperiod, campaignid, campaignname, spend, clicks, impressions, conversions, revenue) VALUES
('2025-08-01', 1234567801, 'I4U - Car Insurance - Exact', 150.25, 450, 30000, 8, 2400.00),
('2025-08-02', 1234567802, 'I4U - Home & Contents - Broad', 120.50, 350, 45000, 6, 1500.00),
('2025-08-03', 1234567803, 'I4U - Travel Insurance - UK', 80.75, 500, 40000, 20, 1000.00),
('2025-08-04', 1234567804, 'I4U - Pet Insurance - Brand', 70.00, 600, 55000, 18, 720.00),
('2025-08-05', 1234567805, 'I4U - Car Insurance - Competitor', 200.00, 550, 35000, 10, 3000.00),
('2025-08-06', 1234567801, 'I4U - Car Insurance - Exact', 155.00, 460, 31000, 9, 2700.00),
('2025-08-07', 1234567802, 'I4U - Home & Contents - Broad', 125.20, 360, 46000, 7, 1750.00),
('2025-08-08', 1234567803, 'I4U - Travel Insurance - UK', 85.30, 510, 41000, 22, 1100.00),
('2025-09-09', 1234567804, 'I4U - Pet Insurance - Brand', 72.50, 620, 56000, 20, 800.00),
('2025-09-10', 1234567805, 'I4U - Car Insurance - Competitor', 205.80, 560, 36000, 11, 3300.00),
('2025-09-11', 1234567806, 'I4U - Van Insurance - Phrase', 90.00, 200, 15000, 5, 2000.00),
('2025-09-12', 1234567807, 'I4U - Landlord Insurance - Exact', 110.40, 250, 18000, 4, 1600.00),
('2025-09-13', 1234567808, 'I4U - Multi-Car Discount - Brand', 130.00, 700, 60000, 15, 5250.00),
('2025-09-14', 1234567801, 'I4U - Car Insurance - Exact', 160.75, 470, 32000, 10, 3000.00),
('2025-09-15', 1234567802, 'I4U - Home & Contents - Broad', 130.00, 370, 47000, 8, 2000.00),
('2025-10-16', 1234567803, 'I4U - Travel Insurance - UK', 90.00, 520, 42000, 24, 1200.00),
('2025-10-17', 1234567804, 'I4U - Pet Insurance - Brand', 75.80, 630, 57000, 21, 840.00),
('2025-10-18', 1234567805, 'I4U - Car Insurance - Competitor', 210.20, 570, 37000, 12, 3600.00),
('2025-10-19', 1234567806, 'I4U - Van Insurance - Phrase', 95.50, 210, 16000, 6, 2400.00),
('2025-10-20', 1234567807, 'I4U - Landlord Insurance - Exact', 115.00, 260, 19000, 5, 2000.00),
('2025-10-21', 1234567808, 'I4U - Multi-Car Discount - Brand', 135.60, 710, 61000, 16, 5600.00),
('2025-10-22', 1234567801, 'I4U - Car Insurance - Exact', 165.00, 480, 33000, 11, 3300.00),
('2025-10-23', 1234567802, 'I4U - Home & Contents - Broad', 135.25, 380, 48000, 9, 2250.00),
('2025-11-24', 1234567803, 'I4U - Travel Insurance - UK', 95.00, 530, 43000, 25, 1250.00),
('2025-11-25', 1234567804, 'I4U - Pet Insurance - Brand', 78.30, 640, 58000, 22, 880.00),
('2025-11-26', 1234567805, 'I4U - Car Insurance - Competitor', 215.00, 580, 38000, 13, 3900.00),
('2025-11-27', 1234567806, 'I4U - Van Insurance - Phrase', 100.80, 220, 17000, 7, 2800.00),
('2025-11-28', 1234567807, 'I4U - Landlord Insurance - Exact', 120.90, 270, 20000, 6, 2400.00),
('2025-11-29', 1234567808, 'I4U - Multi-Car Discount - Brand', 140.00, 720, 62000, 17, 5950.00),
('2025-11-30', 1234567809, 'I4U - Business Insurance - General', 180.00, 300, 25000, 5, 4000.00),
('2025-11-30', 1234567810, 'I4U - Life Insurance - Term', 160.50, 250, 28000, 4, 3200.00);



INSERT INTO seo_ranking (profile, date, keyword, website, url, position, average_monthly_searches) VALUES
('Insurance4You', '2025-08-01', 'car insurance quote', 'insurance4you.co.uk', '/car-insurance/quote', 5, 250000),
('Insurance4You', '2025-08-01', 'home insurance', 'insurance4you.co.uk', '/home-insurance/', 8, 180000),
('Insurance4You', '2025-08-01', 'cheap travel insurance', 'insurance4you.co.uk', '/travel-insurance/', 12, 90000),
('Insurance4You', '2025-08-15', 'pet insurance for dogs', 'insurance4you.co.uk', '/pet-insurance/', 6, 75000),
('Insurance4You', '2025-08-15', 'multi car insurance', 'insurance4you.co.uk', '/car-insurance/multi-car', 15, 60000),
('Insurance4You', '2025-08-28', 'van insurance quote', 'insurance4you.co.uk', '/van-insurance/quote', 18, 45000),
('Insurance4You', '2025-09-01', 'car insurance quote', 'insurance4you.co.uk', '/car-insurance/quote', 4, 250000),
('Insurance4You', '2025-09-01', 'home insurance', 'insurance4you.co.uk', '/home-insurance/', 9, 180000),
('Insurance4You', '2025-09-15', 'cheap travel insurance', 'insurance4you.co.uk', '/travel-insurance/', 11, 90000),
('Insurance4You', '2025-09-15', 'pet insurance for dogs', 'insurance4you.co.uk', '/pet-insurance/', 7, 75000),
('Insurance4You', '2025-09-28', 'multi car insurance', 'insurance4you.co.uk', '/car-insurance/multi-car', 14, 60000),
('Insurance4You', '2025-09-28', 'landlord insurance uk', 'insurance4you.co.uk', '/landlord-insurance/', 20, 30000),
('Insurance4You', '2025-10-01', 'car insurance quote', 'insurance4you.co.uk', '/car-insurance/quote', 5, 250000),
('Insurance4You', '2025-10-01', 'home insurance', 'insurance4you.co.uk', '/home-insurance/', 9, 180000),
('Insurance4You', '2025-10-15', 'cheap travel insurance', 'insurance4you.co.uk', '/travel-insurance/', 12, 90000),
('Insurance4You', '2025-10-15', 'pet insurance for dogs', 'insurance4you.co.uk', '/pet-insurance/', 6, 75000),
('Insurance4You', '2025-10-28', 'van insurance quote', 'insurance4you.co.uk', '/van-insurance/quote', 17, 45000),
('Insurance4You', '2025-10-28', 'motorbike insurance', 'insurance4you.co.uk', '/motorbike-insurance/', 22, 40000),
('Insurance4You', '2025-11-01', 'car insurance quote', 'insurance4you.co.uk', '/car-insurance/quote', 4, 250000),
('Insurance4You', '2025-11-01', 'home insurance', 'insurance4you.co.uk', '/home-insurance/', 8, 180000),
('Insurance4You', '2025-11-15', 'multi car insurance', 'insurance4you.co.uk', '/car-insurance/multi-car', 13, 60000),
('Insurance4You', '2025-11-15', 'cheap travel insurance', 'insurance4you.co.uk', '/travel-insurance/', 10, 90000),
('Insurance4You', '2025-11-28', 'pet insurance for dogs', 'insurance4you.co.uk', '/pet-insurance/', 5, 75000),
('Insurance4You', '2025-11-28', 'landlord insurance uk', 'insurance4you.co.uk', '/landlord-insurance/', 19, 30000),
('Insurance4You', '2025-11-30', 'business insurance quote', 'insurance4you.co.uk', '/business-insurance/quote', 25, 25000),
('Insurance4You', '2025-11-30', 'life insurance uk', 'insurance4you.co.uk', '/life-insurance/', 15, 80000);


