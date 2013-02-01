package test.unittest.context
{
	import com.xmlalibrary.context.BasePropertyContext;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	
	
	public class BasePropertyContextTest
	{		
		[Test]
		public function templateTest():void {
			var a:BasePropertyContext = new BasePropertyContext();
			var xml:XML = <Properties><PropertyList></PropertyList></Properties>;
			
			assertNotNull(a.template());
			assertEquals(xml.toXMLString(), a.template().toString());
		}
	}
}