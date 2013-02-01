package test.unittest.utils {

	import com.xmlalibrary.utils.SOAPUtils;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	/**
	 *
	 * Test case for SOAPUtil class.
	 *
	 * @see mx.utils.SOAPUtils
	 */
	public class SOAPUtilTest {
		public function SOAPUtilTest() {
		}

		//-------------------------------
		// Tests methods
		//-------------------------------
		[Test]
		public function testGetSoapXML():void {
			var xmlFunction:XML=<miFuncion>hola</miFuncion>;

			var xmlA:XML=SOAPUtils.soapEnvolvedXML();
			var bodyNode:XML=xmlA.children()[0];
			bodyNode.appendChild(xmlFunction);

			var xmlB:XML=SOAPUtils.getSoapXML(xmlFunction);
			
			var aS:String = xmlA.toXMLString();
			var bS:String = xmlB.toXMLString();
			assertEquals("No genero corectamente el SOAP", aS, bS);
		}
		
		[Test]
		public function testWithOutFunction():void {
			var xmlFunction:XML=null;
			
			var xmlA:XML=SOAPUtils.soapEnvolvedXML();
			var bodyNode:XML=xmlA.children()[0];
			bodyNode.appendChild(xmlFunction);
			
			var xmlB:XML=SOAPUtils.getSoapXML(xmlFunction);
			
			assertNull("Crea un soap sin funcion", xmlB);
		}
		
		[Test]
		public function soapEnvolvedXMLTest():void {
			var xmlA:XML=SOAPUtils.soapEnvolvedXML();
			var xml:XML = <SOAP-ENV:Envelope 
							xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" 
							SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" >
								<SOAP-ENV:Body /> 
							</SOAP-ENV:Envelope>;
			
			assertEquals(xml.toXMLString(), xmlA.toXMLString());
		}
		
		
	}
}