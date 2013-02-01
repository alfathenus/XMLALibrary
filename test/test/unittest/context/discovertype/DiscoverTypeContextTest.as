package test.unittest.context.discovertype
{
	import com.xmlalibrary.context.discovertype.DiscoverTypeContext;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	
	public class DiscoverTypeContextTest
	{		
		[Test]
		public  function nodeDepthTest():void {
			var a:DiscoverTypeContext = new DiscoverTypeContext();
			
			assertEquals(0, a.nodeDepth);
		}
		
		[Test]
		public  function useRootNodeTest():void {
			var a:DiscoverTypeContext = new DiscoverTypeContext();
			
			assertTrue(a.useRootNode);
		}
		
		[Test]
		public function templateTest():void {
			var a:DiscoverTypeContext = new DiscoverTypeContext();
			var xml:XML = <root></root>;
			
			assertNotNull(a.template());
			assertEquals(xml.toXMLString(), a.template().toXMLString());
		}
		
		[Test]
		public function validateWithOutAcceptPropertiesTest():void {
			var a:DiscoverTypeContext = new DiscoverTypeContext();
			assertTrue(a.validate(DiscoverTypeContext.REQUEST_TYPE));
		}
	}
}