package fakes
{
	import com.xmlalibrary.interfaces.IXMLAContextPart;
	
	public class FakeContextPart implements IXMLAContextPart
	{
		static public const VAR_1:String = "var_1";
		static public const VAR_2:String = "var_2";
		
		
		
		public function FakeContextPart()
		{
		}
		
		public function get nodeDepth():int {
			return 1;
		}
		
		public function useRootNode():Boolean {
			return true;
		}
		
		public function acceptProperties():Array
		{
			return [VAR_1, VAR_2];
		}
		
		public function template():XML
		{
			return <root><data></data></root>;
		}
		
		public function validate(name:String):Boolean {
			if ( name == null || name == "" ) {
				return false;
			}
			if ( this.acceptProperties() == null || this.acceptProperties().length == 0 ) {
				return true;
			}
			return this.acceptProperties().indexOf(name) > -1;
		}
	}
}