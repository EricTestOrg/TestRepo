SELECT algn.LOWST_LVL_ALGNMNT_NM, 
--prod.LOWST_LVL_PROD_NM, prod.LOWST_LVL_PROD_ID, 
  sum(sales.TOT_RX), prod.THCL_PROD_NM
  FROM ASL..ASL_SLS_FRC_SLS_FCT sales, 
  ASL_ALGNMNT_CDIM algn, 
  ASL_PROD_CDIM prod, 
  asl.ASL_TIME_CDIM dt
  where sales.ASL_ALGNMNT_CDIM_ID = algn.ASL_ALGNMNT_CDIM_ID
  and sales.ASL_PROD_CDIM_ID = prod.ASL_PROD_CDIM_ID
  and sales.ASL_TIME_CDIM_ID = dt.ASL_TIME_CDIM_ID
  and lower(algn.LOWST_LVL_ALGNMNT_NM) like '%puerto rico mv 137540%'
  and algn.BSNS_DT_PRPS_CD = 'SALES_DATA_MONTH'
  
  and prod.THCL_PROD_NM = 'MHRT'
  
  
  and sales.SLV_CD = '-1'
  group by 1,3
 LIMIT 100