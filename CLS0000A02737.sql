SET option on_error = CONTINUE;
UPDATE receiver SET name_receiver = 'JENARO  PACHECO HERNANDEZ', rec_fname = 'JENARO', rec_mname = '', rec_lname = 'PACHECO', rec_slname = 'HERNANDEZ', address_receiver = 'SUCHILAPAN VERACRUZ MEXICO', acc_receiver = '', phone1_receiver = '0', phone2_receiver = '0', typeid = 'NN', numid = '', bank_receiver = '', acc_typeid = 'C' WHERE (id_receiver = 2597) AND (id_branch = 'A02737');
COMMIT;
