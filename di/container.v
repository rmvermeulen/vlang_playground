module di

pub interface Builder {
	register()
}

pub interface Context {
	resolve()
}

[heap]
pub struct Service {}

pub struct Container {
mut:
	services  map[string]Service
	factories map[string]Factory<Service>
}

pub type Factory = fn (ctx Context) &Service

pub fn (c Container) register(token string, factory Factory) {
	c.factories[token] = factory
}

pub fn (c Container) resolve(token string) ?&Service {
	if token in c.services {
		return &c.services[token]
	}
	if token in c.factories {
		return &c.factories[token]
	}
	return none
}
