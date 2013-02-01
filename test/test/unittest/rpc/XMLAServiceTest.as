package test.unittest.rpc
{
	import com.xmlalibrary.rpc.XMLAService;
	
	import mx.rpc.events.FaultEvent;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.fail;
	import org.flexunit.async.Async;

	public class XMLAServiceTest
	{	
		static public var service:XMLAService;
		private var asyncFunction:Function;
		
		//-------------------------
		//Configuration
		//-------------------------
		[Before]
		public function setUp():void
		{
			service.request = null;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
			service = new XMLAService();
			
		}
		
		//-------------------------
		//tests
		//-------------------------
		[Test]
		public function useSoapAction_requestHeaderDiscover_test():void {
			service.useSoapAction = true;
			service.request = <Discover xmlns="urn:schemas-microsoft-com:xml-analysis" ></Discover>;
			
			assertNotNull(service.headers);
			assertTrue(service.headers.hasOwnProperty("SOAPAction"));
			assertNotNull(service.headers["SOAPAction"]);
			assertEquals(service.DISCOVER_SOAP_ACTION, service.headers["SOAPAction"]);
			
			assertNotNull(service.headers);
			assertTrue(service.headers.hasOwnProperty("Content-Type"));
			assertNotNull(service.headers["Content-Type"]);
			assertEquals("text/xml", service.headers["Content-Type"]);
		}
		
		[Test]
		public function useSoapAction_requestHeaderExecute_test():void {
			service.useSoapAction = true;
			service.request = <Execute xmlns="urn:schemas-microsoft-com:xml-analysis"></Execute>;
			
			assertNotNull(service.headers);
			assertTrue(service.headers.hasOwnProperty("SOAPAction"));
			assertNotNull(service.headers["SOAPAction"]);
			assertEquals(service.EXECUTE_SOAP_ACTION, service.headers["SOAPAction"]);
			
			assertNotNull(service.headers);
			assertTrue(service.headers.hasOwnProperty("Content-Type"));
			assertNotNull(service.headers["Content-Type"]);
			assertEquals("text/xml", service.headers["Content-Type"]);
		}
		
		[Test]
		public function useSoapAction_requestHeaderExecute_nullValue_test():void {
			service.useSoapAction = true;
			service.request = null;
			
			assertNull(service.headers);
		}
		
		
		[Test]
		public function useSoapActionFalse_requestHeaderDiscover_test():void {
			service.useSoapAction = false;
			service.request = <Discover xmlns="urn:schemas-microsoft-com:xml-analysis" ></Discover>;
			
			assertNotNull(service.headers);
			assertFalse(service.headers.hasOwnProperty("SOAPAction"));
			
			assertNotNull(service.headers);
			assertTrue(service.headers.hasOwnProperty("Content-Type"));
			assertNotNull(service.headers["Content-Type"]);
			assertEquals("text/xml", service.headers["Content-Type"]);
		}
		
		[Test]
		public function useSoapActionFalse_requestHeaderExecute_test():void {
			service.useSoapAction = false;
			service.request = <Execute xmlns="urn:schemas-microsoft-com:xml-analysis"></Execute>;
			
			assertNotNull(service.headers);
			assertFalse(service.headers.hasOwnProperty("SOAPAction"));
			
			assertNotNull(service.headers);
			assertTrue(service.headers.hasOwnProperty("Content-Type"));
			assertNotNull(service.headers["Content-Type"]);
			assertEquals("text/xml", service.headers["Content-Type"]);
		}
		
		[Test]
		public function useSoapActionFalse_requestHeaderExecute_nullValue_test():void {
			service.useSoapAction = false;
			service.request = null;
			
			assertNull(service.headers);
		}
		
		
		[Test(async)]
		public function sendErrorXMLANOTSetted_test():void {
			asyncFunction = Async.asyncHandler( this, handleEvent, 100, null, handleEventNeverOccurred )
			service.addEventListener(FaultEvent.FAULT, asyncFunction, false, 0, true );
			service.send();
		}
		
		//-------------------------
		// Handlers
		//-------------------------
		private function handleEvent(event:FaultEvent, passThroughData:Object = null):void {
			service.removeEventListener(FaultEvent.FAULT, asyncFunction, false );
			assertEquals("Client.XMLAFunctionRequired", event.fault.faultCode);
		}
		
		private function handleEventNeverOccurred(event:FaultEvent, passThroughData:Object = null):void {
			service.removeEventListener(FaultEvent.FAULT, asyncFunction, false );
			fail();
		}
		
	}
}