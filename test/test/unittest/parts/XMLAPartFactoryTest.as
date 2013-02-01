package test.unittest.parts
{
	import com.xmlalibrary.constants.XMLAFunctions;
	import com.xmlalibrary.constants.XMLARequesType;
	import com.xmlalibrary.parts.XMLAPartFactory;
	import com.xmlalibrary.parts.XMLARestrictionsPart;
	
	import fakes.FakeContextPart;
	
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;

	public class XMLAPartFactoryTest
	{		
		[Test]
		public function getPart_null_test():void {
			assertNull(XMLAPartFactory.getPart(null));
		}
		[Test]
		public function getPart_ok_test():void {
			assertNotNull(XMLAPartFactory.getPart(new FakeContextPart()));
		}
		
		
		[Test]
		public function getPropertyPart_null_test():void {
			assertNull(XMLAPartFactory.getPropertyPart(null));
		}
		[Test]
		public function getPropertyPart_empty_test():void {
			assertNull(XMLAPartFactory.getPropertyPart(""));
		}
		[Test]
		public function getPropertyPart_ok_test():void {
			assertNotNull(XMLAPartFactory.getPropertyPart(XMLAFunctions.DISCOVER));
		}
		
		[Test]
		public function getRestrictionPart_null_test():void {
			assertNull(XMLAPartFactory.getRestrictionPart(null));
		}
		[Test]
		public function getRestrictionPart_empty_test():void {
			assertNull(XMLAPartFactory.getRestrictionPart(""));
		}
		[Test]
		public function getRestrictionPart_ok_test():void {
			assertNotNull(XMLAPartFactory.getRestrictionPart(XMLARequesType.CUBES));
		}
	}
}