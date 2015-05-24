select p1.last_name, p1.first_name, p1c.mrn_c, p1.phone_home, r.finalscore,  r.ortsum, r.short_opioid, prov.name, r.medd

FROM reg_provider prov, reg_provider_reg_patient_c provpat,
reg_patient p1, reg_patient_cstm p1c, reg_patient_risk r, reg_patient_comm c

WHERE prov.name like "%" AND
prov.id = provpat.reg_provider_reg_patientreg_provider_ida AND
p1.id = provpat.reg_provider_reg_patientreg_patient_idb AND
p1.id = p1c.id_c AND p1c.active_c = "1" AND
p1.id = r.pid 

