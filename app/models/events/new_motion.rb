class Events::NewMotion < Event
  def self.publish!(motion)
    create(kind: "new_motion",
           eventable: motion,
           discussion: motion.discussion,
           created_at: motion.created_at).tap { |e| EventBus.broadcast('new_motion_event', e) }
  end

  def group_key
    discussion.group.key
  end

  def motion
    eventable
  end
end
