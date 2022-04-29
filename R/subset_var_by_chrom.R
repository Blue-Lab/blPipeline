#' Subset a vector of variant IDs to the specified chromosome(s)
#'
#' @param variant_id A vector of variant IDs
#' @param chrom Chromosome number or numbers
#' @param gds a GDS connection
#'
#' @import SeqArray
#' @export

subset_var_by_chrom <- function(variant_id, chrom, gds) {
  chrom_map <- data.frame(
    id = SeqArray::seqGetData(gds, "variant.id"),
    chromosome = SeqArray::seqGetData(gds, "chromosome")
  )
  chrom_map <- dplyr::filter(chrom_map, chromosome %in% chrom)
  var_id_out <- variant_id[variant_id %in% chrom_map$id]
  return(var_id_out)
}
