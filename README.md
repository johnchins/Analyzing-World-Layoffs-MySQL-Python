# Analyzing-World-Layoffs-MySQL-Python

![Bubble Chart](https://github.com/user-attachments/assets/61b8d665-2673-4ce5-afce-ab8ba7155835)
![layoff by industry and country](https://github.com/user-attachments/assets/b2a1f03d-e73a-4382-8ef1-f8d8ad8c126f)


### Data and Tools
Data: The raw data set conatins very crude data, the rows moved from 2300+ down to 1190 after thorough cleansing.

Tools: **MySQL** for data cleansing and **Python** for data analysis and visualization

### Questions Asked:
1. How have total layoffs changed over time (month-by-month)?
2. In which year(s) did layoffs spike the most?
3. Which industries had the highest total layoffs globally?
4. Which countries experienced the largest number of layoffs?
5. How do layoffs compare across the top 10 industries?
6. Which individual companies recorded the highest layoffs?
7. How do layoffs differ by company stage (Startup, Growth, Post-IPO, etc.)?
8. Are layoffs concentrated in specific countries for certain industries?
9. How do layoffs by industry vary across different countries (heatmap view)?
10. Which industries dominate layoffs in the U.S. compared to other regions?
11. What is the relationship between a company’s funding and its percentage of layoffs (scatter plot)?
12. Do companies at later funding stages tend to have more layoffs than earlier-stage companies?

### Findings Summarized
1. Layoffs were relatively low from 2020 to early 2022 but spiked sharply in 2022–2023, peaking at around **70–80K layoffs per month** in early 2023.

2. The biggest Layoffs spikes occurred in **2022 and early 2023**.

3. Top industries by total layoffs globally (excluding “Other”):

        Consumer & Retail – 39K
        Transportation – 39K
        Finance – 26K
        Healthcare – 24K
        Food – 20K
        Travel – 16K
        Real Estate – 15K
        Sales – 15K
        Hardware – 13K
        Industry (misc.) – 12K

4. Top 10 countries that experienced the largest number of layoffs:

        United States – 225K
        India – 20K
        Netherlands – 17K
        Sweden – 11K
        Brazil – 9K
        Germany – 7K
        Singapore – 6K
        United Kingdom – 6K
        Canada – 5K
        Israel – 3K

5. Consumer & Retail industry are tied at **39K each** layoffs each, then Transportation and Finance follow at **26K and 24K** respectively, with other sectors dropping steadily to 12K.

6. Top 10 companies with the highest layoffs:

        Amazon – 18K
        Google – 12K
        Meta – 11K
        Philips – 10K
        Microsoft – 10K
        Salesforce – 10K
        Ericsson – 8K
        Uber – 8K
        Dell – 7K
        Booking.com – 4K

7. How layoffs differ by company stage:

        **Post-IPO companies – 189K** (by far the largest)
        Next highest stages: Acquired (20K), Series D (16K), Series C (14K), Series B (12K), Series E (10K) etc.

8. The heatmap (Consumer & Retail, Transportation) shows layoffs heavily concentrated in the **U.S.**, with much smaller but visible clusters in India, Netherlands, Sweden, and Brazil.

9. Consumer & Retail layoffs dominate in the U.S., Transportation and Finance have significant numbers in both the U.S. and Europe; tech-heavy countries show spikes in Hardware and SaaS.

10. **Consumer & Retail** and **Transportation** are highest; Europe shows more **Hardware** and **Finance** layoffs relative to its size.

11. The Bubble Map shows **no strong linear correlation**; companies across all funding levels (from low to high millions USD) had widely varying layoff percentages.

12. **Post-IPO and Acquired** stages show much higher total layoffs than Seed or Series A stages.

