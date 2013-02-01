package test.unittest.context.restrictions
{
	import com.xmlalibrary.context.restrictions.CubeRestrictionContext;
	
	import org.flexunit.asserts.assertTrue;

	public class CubeRestrictionContextTest
	{		
		[Test]
		public function validateWithOutAcceptPropertiesTest():void {
			var a:CubeRestrictionContext = new CubeRestrictionContext();
			assertTrue(a.validate(CubeRestrictionContext.CATALOG_NAME));
			assertTrue(a.validate(CubeRestrictionContext.CUBE_NAME));
			assertTrue(a.validate(CubeRestrictionContext.SCHEMA_NAME));
		}
		
	}
}