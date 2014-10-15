
/*
 * SecondScene
 * Created by Eqela Studio 2.0b7.4
 */

public class SecondScene : SEScene
{
	SESprite go;
	int w;
	int h;
	SESprite stage;
	
		public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();
		AudioClipManager.prepare("mario_01");
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		rsc.prepare_image("bg", "stage", w, h);
		stage = add_sprite_for_image(SEImage.for_resource("bg"));
		stage.move(0,0);
			rsc.prepare_image("game", "gameover", 0.2*w, 0.2*h);
		go= add_sprite_for_image(SEImage.for_resource("game"));
	
		go.move(0.4*w, 0.4*h);

		AudioClipManager.play("mario_01");
	
	}

	public void on_pointer_press(SEPointerInfo pi) {
		base.on_pointer_press(pi);
		  if(pi.is_inside(0.4*get_scene_width(),0.4*get_scene_height(),get_scene_width(), 0.4*get_scene_height())) {
			FakeScene.collide=false;
            switch_scene(new MainScene());
        }
	}

		
	

	public void cleanup() {
		base.cleanup();
	}
}
