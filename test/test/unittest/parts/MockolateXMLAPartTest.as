package test.unittest.parts
{
	import com.xmlalibrary.interfaces.IXMLAContextPart;
	import com.xmlalibrary.parts.XMLAPart;
	
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import mockolate.expect;
	import mockolate.expectArg;
	import mockolate.mock;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.received;
	import mockolate.strict;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.fail;
	import org.flexunit.async.Async;
	import org.hamcrest.collection.array;
	import org.hamcrest.collection.hasItems;
	import org.hamcrest.core.anyOf;
	import org.hamcrest.object.equalTo;

	
	
	public class MockolateXMLAPartTest
	{		
		private var contextPart:IXMLAContextPart;
		static private var _xmlaPart:XMLAPart;
		
		[Before(async, timeout=5000, order=1)]
		public function setUp1():void
		{
			Async.proceedOnEvent(this,
				prepare(IXMLAContextPart),
				Event.COMPLETE);
		}
		
		[Before(order=2)]
		public function setUp2():void {
			//contextPart = strict(IXMLAContextPart);
			contextPart = nice(IXMLAContextPart);
			
			mock(contextPart).getter("nodeDepth").returns(1);
			mock(contextPart).method("useRootNode").returns(true);
			mock(contextPart).method("acceptProperties").returns(["var_1", "var_2"]);
			mock(contextPart).method("template").returns(<root><data></data></root>);
			//stub(flavour).method("validate").arg(array("var_1", "var_2"));
			//stub(contextPart).method("validate").args(array("var_1", "var_2")).returns(true);
			//mock(contextPart).method("validate").args(expectArg(array("var_1", "var_2"))).returns(true);
			mock(contextPart).method("validate").args(anyOf(equalTo("var_1"),equalTo("var_2"))).returns(true);
			//expect(contextPart.validate(expectArg(anything())))
			//mock(contextPart).method("validate").args("var_1").returns(true);
			//mock(contextPart).method("validate").args("var_2").returns(true);
			mock(contextPart).method("validate").args("NO_VALIDATE_AND_DONT_ADD").returns(false);
			
			//expectArg(array("cookies", "cream"))
			
			_xmlaPart.clear();
			_xmlaPart.context = contextPart;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
			_xmlaPart = new XMLAPart();
		}
		
		//test for setContext getter/setter
		[Test]
		public function setContext_test():void {
			var context:IXMLAContextPart = _xmlaPart.context;
			assertNotNull(context);
		}
		
		[Test]
		public function setContext_nullObject_test():void {
			_xmlaPart.context = null;
			
			assertEquals(null, _xmlaPart.context);
			
		}
		
		//test for add function
		[Test]
		public function add_nameNull_test():void {
			_xmlaPart.add(null, "as");
			
			assertEquals(0, _xmlaPart.propertiesCount);
			
			
		}
		[Test]
		public function add_nameEmpty_test():void {
			_xmlaPart.add("", "as");
			
			assertEquals(0, _xmlaPart.propertiesCount);
		}
		[Test]
		public function add_valueNull_test():void {
			_xmlaPart.add("var_1", null);
			
			assertEquals(0, _xmlaPart.propertiesCount);
		}
		[Test]
		public function add_valueEmpty_test():void {
			_xmlaPart.add("var_1", "");
			
			assertEquals(0, _xmlaPart.propertiesCount);
		}
		[Test]
		public function addCount1_test():void {
			//@TODO use assumptions
			//mock(contextPart).method("validate").args(anyOf(equalTo("var_1"),equalTo("var_2"))).returns(true);
			_xmlaPart.add("var_1", "HOLA");
			
			assertEquals(1, _xmlaPart.propertiesCount);
			
			var dic:Dictionary = _xmlaPart.propertyList;
			assertNotNull(dic["var_1"]);
			
			//verify(mock(contextPart));
			//verify(mock(contextPart)).method("validate").once();
		}
		[Test]
		public function add_countN_test():void {
			_xmlaPart.add("var_1", "HOLA");
			_xmlaPart.add("var_2", "HOLA");
			
			assertEquals(2, _xmlaPart.propertiesCount);
		}
		[Test]
		public function add_countNoRepit_test():void {
			_xmlaPart.add("var_1", "HOLA");
			_xmlaPart.add("var_1", "HOLA2");
			
			assertEquals(1, _xmlaPart.propertiesCount);
		}
		[Test]
		public function add_notValidateElement_test():void {
			_xmlaPart.add("NO_VALIDATE_AND_DONT_ADD", "HOLA");
			
			assertEquals(0, _xmlaPart.propertiesCount);
		}
		
		//test for rem fucntion
		[Test]
		public function rem_null_test():void {
			_xmlaPart.add("var_1", "HOLA");
			_xmlaPart.rem(null);
			
			assertEquals(1, _xmlaPart.propertiesCount);
		}
		[Test]
		public function rem_empty_test():void {
			_xmlaPart.add("var_1", "HOLA");
			_xmlaPart.rem("");
			
			assertEquals(1, _xmlaPart.propertiesCount);
		}
		[Test]
		public function rem_true_test():void {
			_xmlaPart.add("var_1", "HOLA");
			_xmlaPart.rem("var_1");
			
			assertEquals(0, _xmlaPart.propertiesCount);
			
			var dic:Dictionary = _xmlaPart.propertyList;
			assertNull(dic["var_1"]);
		}
		[Test]
		public function rem_otherElement_test():void {
			_xmlaPart.add("var_1", "HOLA");
			_xmlaPart.rem("var_2");
			
			assertEquals(1, _xmlaPart.propertiesCount);
		}
		
		//test clear function
		[Test]
		public function clear_test():void {
			_xmlaPart.add("var_1", "HOLA");
			_xmlaPart.add("var_2", "HOLA");
			
			_xmlaPart.clear();
			
			assertEquals(0, _xmlaPart.propertiesCount);
			
			var dic:Dictionary = _xmlaPart.propertyList;
			var elem:String;
			var cant:int = 0;
			for ( elem in dic ) {
				cant++;
			}
			assertEquals(0, cant);
		}
		
		//test generate function
		[Test]
		public function generate_test():void {
			_xmlaPart.add("var_1", "HOLA");
			_xmlaPart.add("var_2", "HOLA2");
			
			var xml:XML = _xmlaPart.generate();
			
			var xmlList:XMLList = xml..var_1;
			assertEquals(1, xmlList.length());
			
			xmlList = xml..var_2;
			assertEquals(1, xmlList.length());
		}
		
	}
}