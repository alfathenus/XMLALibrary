package test.unittest.context.restrictions
{
	import com.xmlalibrary.context.restrictions.DimensionRestrictionContext;
	
	import org.flexunit.asserts.assertTrue;

	public class DimensionRestrictionContextTest
	{		
		[Test]
		public function validateWithOutAcceptPropertiesTest():void {
			var a:DimensionRestrictionContext = new DimensionRestrictionContext();
			assertTrue(a.validate(DimensionRestrictionContext.CATALOG_NAME));
			assertTrue(a.validate(DimensionRestrictionContext.CUBE_NAME));
			assertTrue(a.validate(DimensionRestrictionContext.CUBE_SOURCE));
			assertTrue(a.validate(DimensionRestrictionContext.DIMENSION_NAME));
			assertTrue(a.validate(DimensionRestrictionContext.DIMENSION_UNIQUE_NAME));
			assertTrue(a.validate(DimensionRestrictionContext.DIMENSION_VISIBILITY));
			assertTrue(a.validate(DimensionRestrictionContext.SCHEMA_NAME));
		}
	}
}