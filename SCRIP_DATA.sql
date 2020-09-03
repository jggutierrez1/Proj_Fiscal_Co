SET @op_id='220000003';
drop TABLE if exists fiscal_db.operacion; 
drop TABLE if exists fiscal_db.op_cab_fiscal; 
CREATE TABLE fiscal_db.op_cab_fiscal 
SELECT 
	`op_id`,
	`op_fecha`,
	`op_id_cliente` AS op_cod_cliente,
	`op_nombre` 	 AS op_nom_cliente,
	IFNULL(`c_idfiscal2`,'000-000-000') AS op_nip_cliente,
	`op_direc`		AS op_dir_cliente,
	`op_telf`		AS op_tel_cliente,
	`op_tipo`,
	`op_num_corre`,
	`op_num_rel`,
	`op_subtotal`,
	`op_itbms`,
	`op_total`,

	`emp_imp1`,
	`emp_imp2`,
	`emp_imp3`,
	`emp_imp4`,

	`u_id`,
	`op_manejo`,
	`op_observ`,
	`op_desc`,
	`op_subtotalneto`,
	`op_contado`,
	`op_credito`,
	`op_pagado`,
	`op_vuelto`,
	`op_efectivo` AS op_forma_1,
	`op_cheque`   AS op_forma_2,
	`op_tdebito`  AS op_forma_3,
	`op_tcredito` AS op_forma_4,
	`op_tcertificado` AS op_forma_5,
	`op_forma_6`,
	`op_forma_7`,
	`op_forma_8`,
	`op_forma_9`,
	`op_forma_10`,
	`op_forma_11`,
	`op_forma_12`,
	`op_forma_13`,
	`op_forma_14`,
	`op_forma_15`,
	`op_forma_16`,
	`op_forma_17`,
	`op_forma_18`,
	`op_forma_19`,
	`op_forma_20`,
	`op_totitems`,
	`op_v_id`,
	`op_num_nco`,
	`op_num_ncf`,
	`op_numserie_if`
FROM rctech.operacion op
WHERE op.op_id=@op_id;

drop TABLE if exists fiscal_db.op_det_fiscal; 
CREATE TABLE fiscal_db.op_det_fiscal 
SELECT 
	po.po_id				AS Prod_id,
	po.po_op_id			AS Prod_Op_Id,
	po.po_id_prod		AS Prod_Codigo,
	CASE 
	WHEN TRIM(IFNULL(po.po_pr_detalle,""))<>"" THEN TRIM(CONCAT(TRIM(po.po_descripcion),",",TRIM(IFNULL(po.po_pr_detalle," "))))
	WHEN TRIM(IFNULL(po.po_pr_detalle,""))="" THEN TRIM(po.po_descripcion)
	END AS Prod_Descrip,
	Round(SUM(po.po_cant), 3)AS Prod_Cant,
	po.po_precio  		AS Prod_Precio,
 	(Round(Round(po.po_cant, 3)  * po.po_precio, 2)) AS Prod_total, 
	po.po_itbms			AS Prod_Itbms,
	po.po_desc1			AS Prod_Desc1, 
  	po.po_desc2			AS Prod_Desc2, 
  	po.pr_garantia		AS Prod_Garant_Dias, 
  	po.pr_condiciones	AS Prod_Garant_Text 

FROM rctech.producto_op po
WHERE po.po_op_id=@op_id;
