Alternativa3D8Zeta
A modification to Alternativa3D ( http://www.alternativaplatform.com/ ) version 8 code-base , mainly to support full seamless backward compatability and portability from some earlier version 7 projects.

Here are the differences from the the default version 8 build:


Version 7 backward compatability:
-----------------------

- Dummy calculateBounds() method for calculateBoundBox().

- An Object3DContainer class. Using calculateBoundBox() for an Object3DContainer, will also calculate bounds against all nested children and descendants currently existing within it just like in version 7, making this useful for general purposes as well without having to rely on manual Object3DUtils.calculateHierarchyBoundBox() calls.

- All Object3Ds have an alpha property that materials will use instead (just like in version 7). So, texture materials no longer have their own alpha property. For FillMaterial, a simple multiplcation is done with the object alpha and material alpha to determine the final alpha.


Invalidation routine changes: ( opt out to be considered in the future. This is provided only for games that rely solely on accessing Object3D euler properties directly for game entity logic, which isn't the right practice anyway. )
---------------------------------

- No euler invalidation getters and setters for Object3D class. Instead, these act as public variables like how it was in version 7 before, making access of these variables seamless without any additional performance overhead. 

- However,you must now manually flag "transformChanged" on any Object3Ds if you performed any changes on them via the public variables. Normally, if you're running a complete entity/component rendering update system in your own game framework, flagging such Object3Ds as changed/unchanged will usually be done anyway. You only just need to swap out your rendering system class implementation to include the invalidation logic, if you're deploying for version 8.

- Additional public Object3D.invalidate() method (simply does: transformedChanged = true) to allow any 3rd party tween engine to easily use this invalidation method during any tweening of multiple public properties.


Animation Package:
---------------------------------
- AnimationClip.time is now a simple public variable, since the getter and setter method does nothing special and is therefore redundant.

- AnimationController uses update(interval:Number) method instead and no longer uses it's own getTimer() call, requiring user to manually specific the interval time to update in seconds. This approach often works better with other existing game frameworks that already have their own tick timer. A refresh() method is also available that simply does an inline "update(0)" call.  This also allows external tween/game engines to call this method manually after setting the AnimationClip.time property. 


Controller Package:
------------------------
- SimpleObjectController uses update(frameTime:Number)  method instead and no longer uses it's own getTimer() call, just like in AnimationController.