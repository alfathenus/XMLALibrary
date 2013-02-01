package test.unittest.parts
{
	import com.xmlalibrary.interfaces.IXMLAContextPart;
	import com.xmlalibrary.parts.XMLAPart;
	
	import fakes.FakeContextPart;
	
	import flash.utils.Dictionary;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;

	public class XMLAPartTest
	{
		static private var _xmlaPart:XMLAPart
		[Before]
		public function setUp():void
		{
			_xmlaPart.clear();
			_xmlaPart.context = new FakeContextPart();
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
			_xmlaPart.add(FakeContextPart.VAR_1, null);
			
			assertEquals(0, _xmlaPart.propertiesCount);
		}
		[Test]
		public function add_valueEmpty_test():void {
			_xmlaPart.add(FakeContextPart.VAR_1, "");
			
			assertEquals(0, _xmlaPart.propertiesCount);
		}
		[Test]
		public function addCount1_test():void {
			//@TODO use assumptions
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA");
			
			assertEquals(1, _xmlaPart.propertiesCount);
			
			var dic:Dictionary = _xmlaPart.propertyList;
			assertNotNull(dic[FakeContextPart.VAR_1]);
		}
		[Test]
		public function add_countN_test():void {
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA");
			_xmlaPart.add(FakeContextPart.VAR_2, "HOLA");
			
			assertEquals(2, _xmlaPart.propertiesCount);
		}
		[Test]
		public function add_countNoRepit_test():void {
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA");
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA2");
			
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
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA");
			_xmlaPart.rem(null);
			
			assertEquals(1, _xmlaPart.propertiesCount);
		}
		[Test]
		public function rem_empty_test():void {
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA");
			_xmlaPart.rem("");
			
			assertEquals(1, _xmlaPart.propertiesCount);
		}
		[Test]
		public function rem_true_test():void {
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA");
			_xmlaPart.rem(FakeContextPart.VAR_1);
			
			assertEquals(0, _xmlaPart.propertiesCount);
			
			var dic:Dictionary = _xmlaPart.propertyList;
			assertNull(dic[FakeContextPart.VAR_1]);
		}
		[Test]
		public function rem_otherElement_test():void {
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA");
			_xmlaPart.rem(FakeContextPart.VAR_2);
			
			assertEquals(1, _xmlaPart.propertiesCount);
		}
		
		//test clear function
		[Test]
		public function clear_test():void {
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA");
			_xmlaPart.add(FakeContextPart.VAR_2, "HOLA");
			
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
			_xmlaPart.add(FakeContextPart.VAR_1, "HOLA");
			_xmlaPart.add(FakeContextPart.VAR_2, "HOLA2");
			
			var xml:XML = _xmlaPart.generate();
			
			var xmlList:XMLList = xml..var_1;
			assertEquals(1, xmlList.length());
			
			xmlList = xml..var_2;
			assertEquals(1, xmlList.length());
		}
	}
}