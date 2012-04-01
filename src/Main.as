package 
{
	import alternativa.engine3d.animation.AnimationClip;
	import alternativa.engine3d.core.Camera3D;
	import alternativa.engine3d.core.Object3D;
	import alternativa.engine3d.loaders.Parser3DS;
	import alternativa.engine3d.loaders.ParserA3D;
	import alternativa.engine3d.loaders.ParserCollada;
	import alternativa.engine3d.materials.FillMaterial;
	import alternativa.engine3d.materials.LightMapMaterial;
	import alternativa.engine3d.materials.StandardMaterial;
	import alternativa.engine3d.materials.TextureMaterial;
	import alternativa.engine3d.objects.Object3DContainer;
	import alternativa.engine3d.objects.Skin;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Glenn Ko
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
	
		}
		
	}
	
}