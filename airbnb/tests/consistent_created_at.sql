SELECT
    l.listing_id,
    l.created_at AS listing_created_at,
    r.review_date AS review_created_at
FROM {{ ref('dim_listings_cleansed')}} l
INNER JOIN {{ ref('fct_reviews')}} r ON l.listing_id = r.listing_id
WHERE l.created_at > r.review_date
LIMIT 10