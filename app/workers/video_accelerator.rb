class VideoAccelerator
	@queue = :posts_queue

	def self.perform(post_id)
		post = Post.find(post_id)
		init = `mv #{post.video.path} #{post.video.path}input.mp4`
		command = `ffmpeg -i #{post.video.path}input.mp4 -filter:v "setpts=0.5*PTS" #{post.video.path}`

	end
end