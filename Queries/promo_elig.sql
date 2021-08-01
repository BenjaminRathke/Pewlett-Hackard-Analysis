SELECT COUNT(title), title
INTO promo_elig
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM promo_elig
