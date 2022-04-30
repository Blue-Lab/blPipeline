SEXCHECK_COLNAMES <- c("FID", "IID", "PEDSEX", "SNPSEX", "STATUS", "F")
READ_SEXCHECK_COLNAME_WARN <- "read_sexcheck() was able to succesfully read %s, but the colnames were:\n%s;\ninstead of:\n%s" 
IDS_NOT_PRESENT_SBC_WARN <- "There are IDs in variant_id that are not found in gds"
utils::globalVariables(c("chromosome"))
