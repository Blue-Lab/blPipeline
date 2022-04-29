subset_var_by_chrom <- function(variant_id, chrom, gds) {
  chrom_map <- data.frame(
    id = SeqArray::seqGetData(gds, "variant.id"),
    chromosome = SeqArray::seqGetData(gds, "chromosome")
  )
  chrom_map <- dplyr::filter(chrom_map, chromosome == chrom)
  var_id_out <- variant_id[variant_id %in% chrom_map$id]
  return(var_id_out)
}
