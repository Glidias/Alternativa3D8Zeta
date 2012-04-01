package alternativa.engine3d.objects 
{
	import alternativa.engine3d.core.BoundBox;
	import alternativa.engine3d.core.Object3D;
	import alternativa.engine3d.alternativa3d;
	import alternativa.engine3d.core.Transform3D;
	import alternativa.engine3d.utils.Object3DUtils;
	use namespace alternativa3d;
	/**
	 * 
	 * @author Glenn Ko
	 */
	public class Object3DContainer extends Object3D
	{
		
		public function Object3DContainer() 
		{
			
		}
		
		override public function calculateBoundBox():void {
			if (boundBox != null) {
				boundBox.reset();
			} else {
				boundBox = new BoundBox();
			}
			Object3DUtils.calculateHierarchyBoundBox(this, null, boundBox);
		}
		
	}

}