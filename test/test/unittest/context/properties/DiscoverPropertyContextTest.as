package test.unittest.context.properties
{
	import com.xmlalibrary.context.properties.DiscoverPropertyContext;
	import com.xmlalibrary.context.restrictions.CubeRestrictionContext;
	
	import org.flexunit.asserts.assertTrue;
	
	public class DiscoverPropertyContextTest
	{		
		[Test]
		public function validateWithOutAcceptPropertiesTest():void {
			var a:DiscoverPropertyContext = new DiscoverPropertyContext();
			assertTrue(a.validate(DiscoverPropertyContext.DATA_SOURCE_INFO));
			assertTrue(a.validate(DiscoverPropertyContext.FORMAT));
			assertTrue(a.validate(DiscoverPropertyContext.SHOW_HIDDEN_CUBES));
		}
	}
}