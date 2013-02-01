package test.unittest.parts
{
	import com.xmlalibrary.constants.XMLARequesType;
	import com.xmlalibrary.parts.XMLARestrictionsPart;
	
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;

	public class XMLARestrictionsPartTest
	{		
		//test for restrictionsType getter/setter
		[Test]
		public function restrictionsType_ok_test():void {
			var part:XMLARestrictionsPart = new XMLARestrictionsPart();
			part.restrictionsType = XMLARequesType.CUBES;
			
			assertNotNull(part.context);
		}
		[Test]
		public function restrictionsType_bad_test():void {
			var part:XMLARestrictionsPart = new XMLARestrictionsPart();
			part.restrictionsType = "BAD";
			
			assertNull(part.context);
		}
	}
}