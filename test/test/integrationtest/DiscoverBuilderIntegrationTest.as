package test.integrationtest
{
	import com.xmlalibrary.builders.XMLADiscoverBuilder;
	import com.xmlalibrary.constants.XMLAFunctions;
	import com.xmlalibrary.constants.XMLARequesType;
	import com.xmlalibrary.context.properties.DiscoverPropertyContext;
	import com.xmlalibrary.context.restrictions.DimensionRestrictionContext;
	import com.xmlalibrary.parts.XMLAPartFactory;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	public class DiscoverBuilderIntegrationTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[Test]
		public function generate_test():void {
			var builder:XMLADiscoverBuilder = new XMLADiscoverBuilder();
			
			builder.setDiscoverTypePart(XMLAPartFactory.getDiscoverTypePart("custom_request_Type"));
			builder.setRestrictionPart(XMLAPartFactory.getRestrictionPart(XMLARequesType.DIMENSION));
			builder.setPropertiesPart(XMLAPartFactory.getPropertyPart(XMLAFunctions.DISCOVER));
			
			builder.addRestriction(DimensionRestrictionContext.CATALOG_NAME,"custom_catalog_name");
			builder.addRestriction(DimensionRestrictionContext.CUBE_SOURCE, "custom_cube_source");
			
			builder.addProperty(DiscoverPropertyContext.DATA_SOURCE_INFO, "custom_data_source_info");
			builder.addProperty(DiscoverPropertyContext.FORMAT, "custom_format");
			
			var xml:XML = builder.generate();
			
			var xmlList:XMLList;
			var s:String;
			
			xmlList = xml..RequestType;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			s = xmlList[0].toString()
			assertEquals("custom_request_Type", s);
			
			xmlList = xml.Restrictions;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			
			xmlList = xml.Restrictions.RestrictionList;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			
			xmlList = xml.Restrictions.RestrictionList.CUBE_SOURCE;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			s = xmlList[0].toString()
			assertEquals("custom_cube_source", s);
			
			xmlList = xml.Restrictions.RestrictionList.CATALOG_NAME;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			s = xmlList[0].toString()
			assertEquals("custom_catalog_name", s);
			
			xmlList = xml.Properties;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			
			xmlList = xml.Properties.PropertyList;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			
			xmlList = xml.Properties.PropertyList.DataSourceInfo;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			s = xmlList[0].toString()
			assertEquals("custom_data_source_info", s);
			
			xmlList = xml.Properties.PropertyList.Format;
			assertNotNull(xmlList);
			assertEquals(1, xmlList.length());
			s = xmlList[0].toString()
			assertEquals("custom_format", s);
		}
	}
}