package test.unittest.context
{
	import com.xmlalibrary.context.BaseRestrictionsContext;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	
	public class BaseRestrictionsContextTest
	{		
		[Test]
		public function templateTest():void {
			var a:BaseRestrictionsContext = new BaseRestrictionsContext();
			var xml:XML = <Restrictions><RestrictionList></RestrictionList></Restrictions>;
			
			assertNotNull(a.template());
			assertEquals(xml.toXMLString(), a.template().toString());
		}		
		
	}
}