package test.unittest.context.commands
{
	import com.xmlalibrary.context.commands.StatementCommandContext;
	
	import org.flexunit.asserts.assertTrue;
	
	public class StatementCommandContextTest
	{		
		[Test]
		public function validateTest():void {
			var a:StatementCommandContext = new StatementCommandContext();
			assertTrue(a.validate(StatementCommandContext.STATEMENT));
		}
	}
}