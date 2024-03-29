if( require( "RUnit", quietly=TRUE ) ) {
  pkg <- "rbioc2011"
 
  if( Sys.getenv( "RCMDCHECK" ) == "FALSE" ) {
    path <- file.path( getwd(), "..", "inst", "unitTests" )
  }
  else {
    path <- system.file( package=pkg, "unitTests" )
  }

  cat( "\nRunning unit tests\n" )
  print( list( pkg=pkg, getwd=getwd(), pathToUnitTests=path ) )
  library( package=pkg, character.only=TRUE )

  #Fail on warnings
  options( warn=2 )

  # Get the pattern (if there is one?)
  patt = Sys.getenv( "RUNITFILEPATTERN" )
  func = Sys.getenv( 'RUNITFUNCPATTERN' )
  if( is.null( patt ) || nchar( patt ) == 0 ) {
    patt = "^runit.+\\.[rR]$"
  }
  else {
    patt = paste( "^runit\\.", patt, "\\.[rR]$", sep="" )
  }
  if( is.null( func ) || nchar( func ) == 0 ) {
    func = "^test.+"
  }
  else {
    func = paste( "^test\\.", func, ".+", sep="" )
  }
  testSuite <- defineTestSuite( name=paste( pkg, "unit testing" ), testFileRegexp=patt, testFuncRegexp=func, dirs=path )
  tests <- runTestSuite( testSuite )
 
  pathReport <- file.path( path, "report" )
 
  cat( "------------------- UNIT TEST SUMMARY ---------------------\n\n" )
  printTextProtocol( tests, showDetails=FALSE )
  printTextProtocol( tests, showDetails=FALSE, fileName=paste( pathReport, "Summary.txt", sep="" ) )
  printTextProtocol( tests, showDetails=TRUE,  fileName=paste( pathReport, ".txt", sep="" ) )
 
  printHTMLProtocol( tests, fileName=paste( pathReport, ".html", sep="" ) )
 
  tmp <- getErrors( tests )
  if( tmp$nFail > 0 | tmp$nErr > 0 ) {
    stop( paste( "\n\nunit testing failed (#test failures: ", tmp$nFail, ", #R errors: ",  tmp$nErr, ")\n\n", sep="" ) )
  }
} else {
  warning( "cannot run unit tests -- package RUnit is not available" )
}
