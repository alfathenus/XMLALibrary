package test.unittest.context
{
	import fakes.MockAbstractContext;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;

	
	public class AbstractContextTest
	{		
		[Test]
		public  function nodeDepthTest():void {
			var a:MockAbstractContext = new MockAbstractContext();
			
			assertEquals(1, a.nodeDepth);
		}
		
		[Test]
		public  function useRootNodeTest():void {
			var a:MockAbstractContext = new MockAbstractContext();
			
			assertTrue(a.useRootNode);
		}
		
		
		[Test]
		public function templateTest():void {
			var a:MockAbstractContext = new MockAbstractContext();
			var xml:XML = <root><PropertyList></PropertyList></root>;
			
			assertNotNull(a.template());
			assertEquals(xml.toXMLString(), a.template().toString());
		}		
		
		[Test]
		public function acceptPropertiesTest():void {
			var a:MockAbstractContext = new MockAbstractContext();
			var xml:XML = <root><PropertyList></PropertyList></root>;
			
			assertNotNull(a.acceptProperties());
			assertEquals(0, a.acceptProperties().length);
		}
		
		[Test]
		public function validateNullTest():void {
			var a:MockAbstractContext = new MockAbstractContext();
			assertFalse(a.validate(null));
		}
		
		[Test]
		public function validateEmptyTest():void {
			var a:MockAbstractContext = new MockAbstractContext();
			assertFalse(a.validate(""));
		}
		
		[Test]
		public function validateWithOutAcceptPropertiesTest():void {
			var a:MockAbstractContext = new MockAbstractContext();
			assertTrue(a.validate("hola"));
		}
		
	}
}