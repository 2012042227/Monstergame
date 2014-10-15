
/*
 * EnemyEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class EnemyEntity : SEEntity
{
	SESprite enemy;
	
	int w;
	int h;
	int ex;
	int ey;

	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();
		rsc.prepare_image("tifa", "tifalockheart", 0.1*w, 0.2*h);
		
		enemy = add_sprite_for_image(SEImage.for_resource("tifa"));
		enemy.move(Math.random(0,w), Math.random(0,h));
		
		
	}

	public void tick(TimeVal now, double delta) {
		base.tick(now, delta);
			ex = enemy.get_x();
		ey = enemy.get_y();
		enemy.move(ex+(FakeScene.x-ex)/Math.random(100, 500), ey+(FakeScene.y-ey)/Math.random(100, 500));
		
		if((ex +0.15*get_scene_width()>= FakeScene.x && ex<=FakeScene.x) && (ey+0.15*get_scene_height() >= FakeScene.y&&ey<=FakeScene.y)) {
			FakeScene.collide = true;			
		}
		
		
	}

	public void cleanup() {
		base.cleanup();
	}
}
