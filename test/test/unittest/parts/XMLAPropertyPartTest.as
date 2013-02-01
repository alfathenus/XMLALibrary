package test.unittest.parts
{
	import com.xmlalibrary.constants.XMLAFunctions;
	import com.xmlalibrary.parts.XMLAPropertyPart;
	
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;

	public class XMLAPropertyPartTest
	{		
		//test for functionType getter/setter
		[Test]
		public function functionType_ok_test():void {
			var part:XMLAPropertyPart = new XMLAPropertyPart();
			part.functionType = XMLAFunctions.DISCOVER;
			
			assertNotNull(part.context);
		}
		
		[Test]
		public function functionType_badFunctionType_test():void {
			var part:XMLAPropertyPart = new XMLAPropertyPart();
			part.functionType = "BAD";
			
			assertNull(part.context);
		}
	}
}