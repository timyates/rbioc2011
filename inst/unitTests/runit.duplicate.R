# .setUp is called before each test method
.setUp = function() {}

# .tearDown is called after each test method
.tearDown = function() { }

# An example test
test.duplicate = function() {
  a = duplicate( 'tim' )
  checkEquals( a,  c( 'tim', 'tim' ), "Should contain the string tim repeated twice" )
}

test.rbioc2.duplicate = function() {
  a = duplicate( 'tim', 3 )
  checkEquals( a,  c( 'tim', 'tim', 'tim' ), "Need three tims" )
}
