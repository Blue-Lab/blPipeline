#' Extract alternate allele dosage estimates from a GDS
#'
#' @param gds A GDS connection
#' @param chrom A vector of chromosome numbers
#' @param from.bp A vector of starting BP positions
#' @param to.bp A vector of ending BP positions
#' @import SeqArray
#' @export

extract_dosage_est <- function(gds, chrom, from.bp, to.bp) {
  SeqArray::seqSetFilterChrom(gds, chrom, from.bp = from.bp, to.bp = to.bp)
  out <- as.data.frame(SeqArray::seqGetData(gds, "annotation/format/DS"))
  out$sample.id <- SeqArray::seqGetData(gds, "sample.id")
  seqResetFilter(gds)
  return(out)
}
