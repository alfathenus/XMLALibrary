package test.unittest.context.properties
{
	import com.xmlalibrary.context.properties.ExecutePropertyContext;
	
	import org.flexunit.asserts.assertTrue;
	
	public class ExecutePropertyContextTest
	{		
		[Test]
		public function validateWithOutAcceptPropertiesTest():void {
			var a:ExecutePropertyContext = new ExecutePropertyContext();
			assertTrue(a.validate(ExecutePropertyContext.AXIS_FORMAT));
			assertTrue(a.validate(ExecutePropertyContext.CATALOG));
			assertTrue(a.validate(ExecutePropertyContext.DATA_SOURCE_INFO));
			assertTrue(a.validate(ExecutePropertyContext.FORMAT));
		}
	}
}