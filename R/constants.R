SEXCHECK_COLNAMES <- c("FID", "IID", "PEDSEX", "SNPSEX", "STATUS", "F")
READ_SEXCHECK_COLNAME_WARN <- "read_sexcheck() was able to succesfully read %s, but the colnames were:\n%s;\ninstead of:\n%s" 
IDS_NOT_PRESENT_SBC_WARN <- "There are IDs in variant_id that are not found in gds"
LENGTH_MISMATCH_ESTRACT_DOSAGE_EST <- "chrom, from.bp and to.bp are not all equal length"
utils::globalVariables(c("chromosome"))
