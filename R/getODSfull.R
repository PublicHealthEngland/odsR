#' getODSfull
#'
#' Extracts full ODS data for a single organisation from the NHS Digital ODS ORD API into a list of length 1.
#'
#' @param ODSCode The organisation to return details for; quoted string; no default
#' @inheritParams getODS
#'
#' @return returns a list of length 1 containing the full details for the Organisation including:
#'         Name, Legal and Operational Start and End Dates, Status, Last Change Date, Organisation Record Class,
#'         Address, Postcode, Contact Information, Roles and Relationships to other Organisations
#'
#' @section Notes: View the NHS Digital ODS API Implementation Guide at
#'          \url{https://developer.nhs.uk/library/identifiers/ods-ord-api-implementation-guide/} \cr \cr
#'          View the NHS Digital ODS API Suite at \url{https://directory.spineservices.nhs.uk/ODSAPISuite}
#'
#' @examples
#' # return full Organisation data for RRF12
#' getODSfull(ODSCode="RRF12")
#'
#' @import dplyr
#' @import jsonlite
#' @import httr
#' @importFrom utils URLencode
#'
#' @export
#'
#' @family odsR package functions
# -------------------------------------------------------------------------------------------------


# create function to allow user to specify parameters to input to ODS API call
getODSfull <- function(ODSCode,
                       UseProxy = FALSE) {

    # check UseProxy is TRUE or FALSE
    if(!is.logical(UseProxy)) {
      stop("ERROR: UseProxy must be TRUE or FALSE")
    } 
    
    # read in proxy settings if using
    if (UseProxy) {
      path <- system.file("extdata", package = "odsR")
      proxySettings <- read.csv(paste0(path,"/UseProxy.csv"), header = TRUE)
    }
  
    urlfull <- utils::URLencode(paste0("https://directory.spineservices.nhs.uk/ORD/2-0-0/organisations/",ODSCode,"?_format=application/json",sep=""))

    # better to set config elsewhere - not within function ??
    set_config(config(ssl_verifypeer = 0L))

    if (UseProxy) {
      httpResponse <- GET(urlfull, accept_json(),
                           use_proxy(url      = proxySettings$url,
                                     port     = proxySettings$port,
                                     username = proxySettings$UserName,
                                     password = proxySettings$password,
                                     auth     = proxySettings$auth))
    } else {
      httpResponse <- GET(urlfull, accept_json())
    }
    
    getODSfull <- fromJSON(content(httpResponse, "text", encoding="UTF-8"))

  return(getODSfull)
}

