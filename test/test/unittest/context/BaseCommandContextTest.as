package test.unittest.context
{
	import com.xmlalibrary.context.BaseCommandContext;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	public class BaseCommandContextTest
	{
		[Test]
		public  function nodeDepthTest():void {
			var a:BaseCommandContext = new BaseCommandContext();
			
			assertEquals(0, a.nodeDepth);
		}
		
		[Test]
		public function templateTest():void {
			var a:BaseCommandContext = new BaseCommandContext();
			var xml:XML = <Command></Command>;
			
			assertNotNull(a.template());
			assertEquals(xml.toXMLString(), a.template().toXMLString());
		}
	}
}