
/*
 * FakeScene
 * Created by Eqela Studio 2.0b7.4
 */

public class FakeScene : SEScene
{
	SESprite stage;
	SESprite go;
	int w;
	int h;
	int i;
	public static int x;
	public static int y;
	public static bool collide=false;
	
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();
		AudioClipManager.prepare("mario_01");
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		rsc.prepare_image("bg", "stage", w, h);
		
		stage = add_sprite_for_image(SEImage.for_resource("bg"));
		stage.move(0,0);
			
		add_entity(new PlayerEntity2());
			for(i=0; i<Math.random(10, 20); i++) {
				add_entity(new EnemyEntity());
			}
				AudioClipManager.play("mario_01");
				
			
	}
	
	public void on_pointer_move(SEPointerInfo pi) {
		base.on_pointer_move(pi);
		x = pi.get_x();
		y = pi.get_y();
		if(FakeScene.collide==true) {
			switch_scene(new SecondScene());}
	}

	public void cleanup() {
		base.cleanup();
	}
}
