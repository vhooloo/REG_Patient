DELIMITER  $$ 

CREATE PROCEDURE CursorProc2(OUT list VARCHAR(2500)) 
	BEGIN 
		DECLARE no_more_products, quantity_in_stock INT DEFAULT 0; 
		DECLARE mrn VARCHAR(255); 
		DECLARE cur_patient CURSOR FOR 
		SELECT mrn_c FROM reg_patient_cstm; 
		  DECLARE CONTINUE HANDLER FOR NOT FOUND 
		SET no_more_products = 1; 


		OPEN cur_patient; 

		FETCH cur_patient INTO mrn; 
			REPEAT 
				 SET list = concat(list, mrn);
			FETCH cur_patient INTO mrn; 
			UNTIL no_more_products = 1 
			END REPEAT; 
		CLOSE cur_patient; 
	 
	END$$ 

DELIMITER ; 

DELIMITER  $$ 
DROP PROCEDURE IF EXISTS PatientProc$$
CREATE PROCEDURE PatientProc() 
	BEGIN 
		DECLARE no_more_products INT DEFAULT 0; 
		DECLARE mrn VARCHAR(255); 
		DECLARE list VARCHAR(2500);
		DECLARE cur_patient CURSOR FOR 
			SELECT mrn_c FROM reg_patient_cstm; 
		DECLARE CONTINUE HANDLER FOR NOT FOUND 
			SET no_more_products = 1; 
        SET LIST = '';
		OPEN cur_patient; 
		FETCH cur_patient INTO mrn; 
			REPEAT 
			     IF list = '' THEN
				 	SET list = concat('\'', mrn, '\'');
				ELSE 
					SET list = concat(list, ',\'', mrn, '\'');
				END IF;
			FETCH cur_patient INTO mrn; 
			UNTIL no_more_products = 1 
			END REPEAT; 
		CLOSE cur_patient; 
		SELECT CONCAT ('[zzz_bwagner_win.s_m_test_labresult] \n $$PATIENTLIST = (', list, ')')  AS the_list;
	 
	END $$ 
DELIMITER ; 

"C:\Program Files (x86)\sugarcrm-6.5.9\mysql\bin\mysql" -uroot -ptrivial -e"call PatientProc();" sugarcrm --skip-column-names> c:\test123.txt

E:\wamp\bin\mysql\mysql5.5.24\bin>mysqldump -u root  topcare  > "e:\top care dep
loyment"\sugardump120913.sql


DELIMITER  $$ 
DROP PROCEDURE IF EXISTS Test123$$
CREATE PROCEDURE Test123() 
	BEGIN 
	 SELECT 'Hello World' AS Greetings;
	END $$
DELIMITER ;



