
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
  	 

		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 	                    
			                    
			                    	