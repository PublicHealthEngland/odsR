% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OrgRelLkp_NHSTrust.R
\name{OrgRelLkpNHSTrust}
\alias{OrgRelLkpNHSTrust}
\title{OrgRelLkp}
\usage{
OrgRelLkpNHSTrust(
  PrimaryRole,
  NonPrimaryRole = "All",
  RelTypes = "None",
  RelPrimaryRoles = "None",
  OpLegal,
  FromDate,
  Useproxy = FALSE
)
}
\arguments{
\item{PrimaryRole}{The Primary Role code for organisations to be included in the lookup;
quoted string, no default}

\item{NonPrimaryRole}{The Non Primary Role code for organisations to be included in the lookup,
or 'All' to include all Non Primary Role Codes;
quoted string, default = "All"}

\item{RelTypes}{The Named Relationship Types for related organisations to be included in the lookup,
or 'None' to exclude Relationships from output;
character vector, default = "None"}

\item{RelPrimaryRoles}{The Primary Role Ids for related organisations to be included in the lookup,
or 'None' to exclude relationships from output;
character vector, default = "None"}

\item{FromDate}{The effective date from which to include Organisations operational/legal on or after;
character string in the format "yyyy-mm-dd", no default}
}
\value{
returns a data.frame of Organisation codes, names, start dates and end dates plus the start and end dates
that the organisation was in the specified role and related organisation codes & names and associated start and end dates
for the relationship.
}
\description{
Generates an organisational lookup table from the NHS Digital ODS ORD API
based on organisational relationship data.
}
\section{Notes}{
 This function is experimental and has only been thoroughly QAd for use with the arguments
         presented in the example code in order to generate NHS Trust to NHS Regional local Office Lookup Tables. \cr \cr
         View the NHS Digital ODS API Implementation Guide at
         \url{https://developer.nhs.uk/library/identifiers/ods-ord-api-implementation-guide/} \cr \cr
         View the NHS Digital ODS API Suite at \url{https://directory.spineservices.nhs.uk/ODSAPISuite}
}

\examples{

# return basic NHS Trust lookup without relationships to other organisation types
\dontrun{
#' OrgRelLkpNHSTrust(PrimaryRole = "RO197",FromDate="2013-04-01")
}

# return NHS Trust to NHS Regional Local Office Lookup to include all organisations effective on or after 01-04-2013
\dontrun{
OrgRelLkpNHSTrust(PrimaryRole     = "RO197",
          NonPrimaryRole  = "All",
          RelTypes        = "RE5",
          RelPrimaryRoles = "RO210",
          FromDate        = "2013-04-01")
}


}
\seealso{
Other odsR package functions: 
\code{\link{OrgRelLkpGP}()},
\code{\link{addorgname}()},
\code{\link{getODSfull}()},
\code{\link{getODS}()}
}
\concept{odsR package functions}
