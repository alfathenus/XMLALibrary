package com.xmlalibrary.utils {
	import flash.errors.IllegalOperationError;

	
	/**
	 * 
	 * Class util for SOAP XML generation.
	 * 
	 */
	public class SOAPUtils {
		//---------------------------
		// Constructor
		//---------------------------
		public function SOAPUtils() {
			throw new IllegalOperationError();
		}
		
		//---------------------------
		// Public methods
		//---------------------------
		/**
		 * SOAP generator function.
		 * 
		 * @param xmlFunction			Funtion to send by SOAP.
		 * 
		 * @example 
		 * <listing version="3.0">
		 * var xml:XML = <function_to_send />;
		 * var soap:XML = SOAPUtils.getSoapXML(xml);
		 * </listing>
		 */
		static public function getSoapXML(xmlFunction:XML):XML {
			if (xmlFunction == null)
				return null;

			var soap:XML=soapEnvolvedXML();

			var bodyNode:XML=soap.children()[0];
			bodyNode.appendChild(xmlFunction);

			return soap;
		}
		
		/**
		 * Gets the envolved SAOP function.
		 */
		static public function soapEnvolvedXML():XML {
			return <SOAP-ENV:Envelope 
							xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" 
							SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" >
						<SOAP-ENV:Body /> 
					</SOAP-ENV:Envelope>;
		}
	}
}