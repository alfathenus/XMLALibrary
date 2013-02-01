package test.integrationtest
{
	import com.xmlalibrary.builders.XMLAExecuteBuilder;
	import com.xmlalibrary.constants.XMLAFunctions;
	import com.xmlalibrary.context.commands.StatementCommandContext;
	import com.xmlalibrary.context.properties.ExecutePropertyContext;
	import com.xmlalibrary.parts.XMLAPartFactory;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	public class ExecuteBuilderIntegrationTest
	{		
		[Test]		
		public function generate_test():void {
			var builder:XMLAExecuteBuilder = new XMLAExecuteBuilder();
			
			builder.setCommandPart(XMLAPartFactory.getCommandPart());
			builder.setPropertiesPart(XMLAPartFactory.getPropertyPart(XMLAFunctions.EXECUTE));
			
			builder.addProperty(ExecutePropertyContext.DATA_SOURCE_INFO, "custom_data_source_info");
			builder.addProperty(ExecutePropertyContext.FORMAT, "custom_format");
			
			builder.addCommand(StatementCommandContext.STATEMENT, "custom_statement");
			
			var xml:XML = builder.generate();
			
			
			var xmlList:XMLList;
			var s:String;
			
			xmlList = xml.Command;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			
			xmlList = xml.Command.Statement;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			s = xmlList[0].toString();
			assertEquals("custom_statement", s);
			
			xmlList = xml.Properties;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			
			xmlList = xml.Properties.PropertyList;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			
			xmlList = xml.Properties.PropertyList.Format;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			s = xmlList[0].toString();
			assertEquals("custom_format", s);
			
			xmlList = xml.Properties.PropertyList.DataSourceInfo;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			s = xmlList[0].toString();
			assertEquals("custom_data_source_info", s);
		}
	}
}