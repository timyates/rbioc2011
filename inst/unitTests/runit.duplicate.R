# .setUp is called before each test method
.setUp = function() {}

# .tearDown is called after each test method
.tearDown = function() { }

# An example test
test.duplicate = function() {
  a = duplicate( 'tim' )
  checkEquals( a,  c( 'tim', 'tim' ), "Should contain the string tim repeated twice" )
}
