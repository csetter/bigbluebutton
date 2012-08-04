package org.bigbluebutton.modules.whiteboard.business.shapes
{
	import org.bigbluebutton.common.LogUtil;
	import org.bigbluebutton.modules.whiteboard.models.Annotation;

	public class RectangleAnnotation extends AnnotationObject
	{
		public function RectangleAnnotation(id:String, type:String, status:String)
		{
			super(id, type, status);
		}
		
		override public function draw(a:Annotation, parentWidth:Number, parentHeight:Number):void {
			LogUtil.debug("Drawing RECTANGLE");
			var ao:Object = a.annotation;
			if (!ao.fill)
				this.graphics.lineStyle(ao.thickness, ao.color, ao.transparency ? 0.6 : 1.0);
			else this.graphics.lineStyle(ao.thickness, ao.color);
			
			var arrayEnd:Number = (ao.points as Array).length;
			var startX:Number = denormalize((ao.points as Array)[0], parentWidth);
			var startY:Number = denormalize((ao.points as Array)[1], parentHeight);
			var width:Number = denormalize((ao.points as Array)[arrayEnd-2], parentWidth) - startX;
			var height:Number = denormalize((ao.points as Array)[arrayEnd-1], parentHeight) - startY;
			
			if (ao.fill) this.graphics.beginFill(ao.fillColor, ao.transparency ? 0.6 : 1.0);
			this.graphics.drawRect(startX,startY,width,height);
		}
		
		override public function redraw(a:Annotation, parentWidth:Number, parentHeight:Number):void {
			draw(a, parentWidth, parentHeight);
		}
	}
}