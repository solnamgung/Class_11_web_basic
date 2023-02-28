
-- ***************************************** Subqueries  ***********************************************

 -- 1. Select ten rows from the flights table.
	SELECT
	      *
	FROM 
	    flights
	LIMIT
	    10;
    
  --  2. Non-Correlated Subqueries : find flight information about flights where the origin elevation is less than 2000 feet.
	 SELECT 
	        *
	   FROM
	        flights 
	  WHERE 
	  		origin IN (
		              SELECT 
		                  code
		              FROM
		                  airports
		              WHERE
		                  elevation < 2000 );   

		SELECT
			    * 
			FROM
			    flights
			WHERE
			    origin IN (
			              SELECT
			                    code
			                FROM
			                    airports
			                WHERE
			                    faa_region = 'ASO');
			                    
			                    
		SELECT
		      a.dep_month,
		      a.dep_day_of_week,
		      AVG(a.flight_distance)   AS average_distance
		  FROM (
		        SELECT dep_month,
		               dep_day_of_week,
		               dep_date,
		               SUM(distance)   AS  flight_distance
		        FROM
		            flights
		    GROUP BY 1, 2, 3
		  )a
		  GROUP BY 1,2
		  ORDER BY 1,2;	                    
			                    
			                    
		 --  3. Correlated subqueries 
		    SELECT
			      id
			 FROM
			      flights AS f
			 WHERE
			      distance < (
			                  SELECT
			                        AVG(distance)
			                    FROM
			                        flights
			                    WHERE
			                        carrier = f.carrier
			      );
				 
		 
-- For instance, assuming flight_id increments with each additional flight, 
-- we could use the following query to view flights by carrier, flight id, and sequence number:					
			SELECT
			      origin, id, ( SELECT
			                          COUNT(*)
			                      FROM
			                          flights f
			                     WHERE
			                          f.id < flights.id
			                       AND
			                          f.carrier = flights.carrier) + 1   AS flight_sequence_number 
			                      FROM
			                          flights; 
		 
		 
		 
		 
-- ************************************* set operation ********************************************************8
		 
	-- union 	 	
	SELECT brand FROM legacy_products
	UNION 
	SELECT brand FROM new_products;	 
			 
 -- union all
	  SELECT id, avg(a.sale_price) FROM (
	  SELECT id, sale_price FROM order_items
	  UNION ALL
	  SELECT id, sale_price FROM order_items_historic) AS a 
	  GROUP BY 1;	 
		 
-- Intersect
  SELECT category FROM new_products
  INTERSECT
  SELECT category FROM legacy_products 
  
  
 -- Except 	
  SELECT category FROM legacy_products 
  EXCEPT
  SELECT category FROM new_products  ;
  	 
 
 -- **********************************Aggregate functions revisited ***************************
 
		-- NULL
		-- We use the special keywords IS NULL or IS NOT NULL in the WHERE clause (= NULL does not work).
		
		SELECT
		      COUNT(*)
		FROM
		    flights
		WHERE
		    1 = 1
		AND arr_time IS NOT NULL
		AND destination = 'ATL'; 
		 
		 
		 
		-- CASE WHEN (If ELSE is not included, the result will be NULL)
		
		 SELECT
		    CASE
		        WHEN elevation < 500 THEN 'Low'
		        WHEN elevation BETWEEN 500 AND 1999 THEN 'Medium'
		        WHEN elevation >= 2000 THEN 'High'
		        ELSE 'Unknown'
		    END AS elevation_tier
		    , COUNT(*)
		FROM airports
		GROUP BY 1;
		 
		-- COUNT(CASE WHEN)
		SELECT state, 
		COUNT(CASE WHEN elevation < 1000 THEN 1 ELSE NULL END) as count_low_elevation_airports 
		FROM airports 
		GROUP BY state;
		
		
	-- SUM(CASE WHEN)	
		SELECT 
		      origin,
		      SUM(distance) AS TOTAL_FLIGHT_DISTANCE,
		      SUM(CASE WHEN carrier = 'UA' THEN distance ELSE 0 END)
		            AS total_united_flight_distance 
		 FROM 
		          flights
	  GROUP BY
	 	        origin;
		        		
	 	
		SELECT
		      origin,
		      SUM(distance) AS total_flight_distance ,
		    SUM(CASE WHEN carrier = 'DL' THEN distance ELSE 0 END) AS total_delta_flight_distance
		FROM 
		    flights
		GROUP BY
		        origin;
		        
	-- Combining aggregates
		  SELECT origin, 
			    (100.0*(sum(CASE WHEN carrier = 'UN' THEN distance ELSE 0 END))/sum(distance)) as percentage_flight_distance_from_united FROM flights 
			GROUP BY origin;      
					        
	SELECT
      origin,
      (100.0 * 
              SUM(CASE WHEN carrier = 'DL' THEN distance ELSE 0 END) / SUM(distance)) 
              AS percentage_flight_distance_from_delta
		FROM
		    flights
		GROUP BY origin;	        
		        
	
		        
		SELECT 
      state,
      100.0 * sum(CASE WHEN elevation >= 2000 THEN 1 ELSE 0 END) / count(*) AS percentage_high_elevation_airports
      FROM
          airports
    GROUP BY
          state;        
		        
		        
		  
 -- DATES
	SELECT
	      DATE(delivery_item),
	      COUNT(*) as count_baked_goods
	FROM
	      baked_goods
	GROUP BY
	        DATE(delivery_time);	
	        
	        
	 SELECT 
      DATETIME(delivery_time, '+5 hours', '20 minutes', '2 days') as package_time
	  FROM
	      baked_goods;       
	        
	        
	SELECT
     	ROUND(distance, 2) AS distance_from_market
	FROM
     	bakeries;        
	        
	    -- Strings
	    
	SELECT first_name || ' ' || last_name as full_name
		FROM bakeries;    
	    
	    SELECT REPLACE(ingredients,'enriched_','') as item_ingredients
		FROM baked_goods;
	    
	    
	        
	        
	        
	        
	        
	                
		        
		        
		        
		
		
		
		
		
		
		
		
		
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 	                    
			                    
			                    	