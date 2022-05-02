#' Extract alternate allele dosage estimates from a GDS
#'
#' @param gds A GDS connection
#' @param chrom A vector of chromosome numbers
#' @param from.bp A vector of starting BP positions
#' @param to.bp A vector of ending BP positions
#' @import SeqArray
#' @export

extract_dosage_est <- function(gds, chrom, from.bp, to.bp) {
  if (length(chrom) != length(from.bp) | length(chrom) != length(to.bp)) {
    stop(LENGTH_MISMATCH_ESTRACT_DOSAGE_EST)
  }
  SeqArray::seqSetFilterChrom(gds, chrom, from.bp = from.bp, to.bp = to.bp)
  out <- as.data.frame(SeqArray::seqGetData(gds, "annotation/format/DS"))
  colnames(out) <- make.names(SeqArray::seqGetData(gds, "annotation/id"))
  out$sample.id <- SeqArray::seqGetData(gds, "sample.id")
  seqResetFilter(gds)
  return(out)
}
