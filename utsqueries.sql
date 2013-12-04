SELECT DISTINCT test_date thisdate,
(SELECT DISTINCT test_results_code from reg_patient_uts_import WHERE  patient_mrn = '2214596' AND test_date = thisdate AND test_type = 'OXYCODONE' AND test_results_code <> 'PEN') oxy,
(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '2214596' AND test_date = thisdate AND test_type = 'OPIATE URINE' AND test_results_code <> 'PEN') opiate,
(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '2214596' AND test_date = thisdate AND test_type = 'METHADONE' AND test_results_code <> 'PEN') methadone,
(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '2214596' AND test_date = thisdate AND test_type = 'COCAIN METAB' AND test_results_code <> 'PEN') cocaine,
(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '2214596' AND test_date = thisdate AND test_type = 'BUPRENO UR' AND test_results_code <> 'PEN') bupreno,
(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '2214596' AND test_date = thisdate AND test_type = 'BENZODIAZ UR' AND test_results_code <> 'PEN') benzo,
(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '2214596' AND test_date = thisdate AND test_type = 'BARBITURA UR'AND test_results_code <> 'PEN') barbi,
(SELECT DISTINCT  test_results_code from reg_patient_uts_import WHERE  patient_mrn = '2214596' AND test_date = thisdate AND test_type = 'AMPHETAMI UR' AND test_results_code <> 'PEN') amph
 FROM reg_patient_uts_import WHERE patient_mrn = '2214596' order by 1 desc;